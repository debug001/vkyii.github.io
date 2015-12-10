---
layout: post
title: Openssl算法套件追踪
category: 备忘
tags: SSL
keywords: SSL Cipher Suite
description: 
---

# [SSL握手协议][1]
## 三个基本阶段：
* 对等协商支持的密钥算法
* 基于非对称密钥的信息传输加密和身份认证、基于PKI证书的身份认证
* 基于对称密钥的数据传输保密

## 在第一阶段,客户端与服务器协商所用密码算法.当前广泛实现的算法选择如下：
* 公钥私钥非对称密钥保密系统：RSA、Diffie-Hellman、DSA
* 对称密钥保密系统：RC2、RC4、IDEA、DES、Triple DES、AES以及Camellia
* 单向散列函数：MD5、SHA1以及SHA256。

# [算法套件][2]
## 用途
由前可知,握手过程中协议了一系列算法,并用以下用途
* 认证算法
* 密钥交换算法
* 对称算法
* 摘要算法
## 算法控制
Openssl通过组合字符串的方式来控制这些算法,如:*ALL:!ADH:RC4+RSA:+SSLv2:@STRENGTH*,具体规则请查阅Openssl官网文档,简单地说,这个字符串功能类似一个正则表达式,有若干算法组合满足条件,客户端与服务端协商时会确定其中一个.

## 算法组
选定一个算法组就有了更具体的形式,像这样:*ECDHE-RSA-AES256-GCM-SHA384*,可以看到一些属性的面孔了,这在代码里是定义在*tls1.h*中的:

	#define TLS1_TXT_ECDHE_RSA_WITH_AES_256_GCM_SHA384      "ECDHE-RSA-AES256-GCM-SHA384"

然后在*ssl/s3\_lib.h*中有如下定义:

	/* Cipher C030 */
	{
	        1,
	    TLS1_TXT_ECDHE_RSA_WITH_AES_256_GCM_SHA384,/*套件名字*/
	    TLS1_CK_ECDHE_RSA_WITH_AES_256_GCM_SHA384,/*套件ID*/
	    SSL_kEECDH,/*密钥交换*/
	    SSL_aRSA,/*认证*/
	    SSL_AES256GCM,/*对称算法*/
	    SSL_AEAD,/*摘要算法*/
	    SSL_TLSV1_2,/*SSL协议版本*/
	    SSL_NOT_EXP|SSL_HIGH|SSL_FIPS,/*算法强度*/
	    SSL_HANDSHAKE_MAC_SHA384|TLS1_PRF_SHA384,
	    256,
	    256,
	},

这是一个* SSL\_CIPHER*结构,其定义如下:

	/* used to hold info on the particular ciphers used */
	struct ssl_cipher_st
	{
	    int valid;
	    const char *name;       /* text name */
	    unsigned long id;       /* id, 4 bytes, first is version */
	
	    /* changed in 0.9.9: these four used to be portions of a single value 'algorithms' */
	    unsigned long algorithm_mkey;   /* key exchange algorithm */
	    unsigned long algorithm_auth;   /* server authentication */
	    unsigned long algorithm_enc;    /* symmetric encryption */
	    unsigned long algorithm_mac;    /* symmetric authentication */
	    unsigned long algorithm_ssl;    /* (major) protocol version */
	
	    unsigned long algo_strength;    /* strength and export flags */
	    unsigned long algorithm2;   /* Extra flags */
	    int strength_bits;      /* Number of bits really used */
	    int alg_bits;           /* Number of bits for algorithm */
	};

主要字段含义写在注释里面了.

## 算法NID
使用OpensslEngine来替换算法时,非对称算法有特定的方法(定义在*crypt/engine/engine.h*):

* RSA: * ENGINE\_set\_RSA*
* ECC: \* ENGINE\_set\_ECDSA
* DH: \* ENGINE\_set\_ECDH
* DSA: * ENGINE\_set\_DSA*

替换对称算法或摘要算法使用* ENGINE\_set\_ciphers*来设置* EVP\_CIPHER*结构,Openssl中很多算法都用到这个结构体,咦我为什么知道.

回到之前*算法组*里面的对称算法* SSL\_AES256GCM*,在*ssl/ssl\_siph.c*中的函数* ssl\_cipher\_get\_evp*中可知其对应的索引号为* SSL\_ENC\_AES256GCM\_IDX*,然后由函数* ssl\_load\_ciphers*可知其对应* SN\_aes\_256\_gcm*,再在*openssl/obj\_mac*中可知其对应* NID\_aes\_256\_gcm*这个NID

在使用* ENGINE\_set\_ciphers*替换时,替换* NID\_aes\_256\_gcm*对应的* EVP\_CIPHER*即替换了AES的256位GCM模式算法.

阿西吧好乱写不下去了

[1]:	https://zh.wikipedia.org/wiki/%E5%82%B3%E8%BC%B8%E5%B1%A4%E5%AE%89%E5%85%A8%E5%8D%94%E8%AD%B0
[2]:	http://blog.chinaunix.net/uid-24709751-id-4050413.html