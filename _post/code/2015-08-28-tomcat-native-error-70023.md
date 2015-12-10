---
layout: post
title: 记录Apr+Tomcat-Native出现的一个雪崩错误
category: 
tags: Openssl
keywords: 
description: 
---

# 错误长这样
	org.apache.tomcat.jni.Error: 70023: This function has not been implemented on this platform
	        at org.apache.tomcat.jni.SSL.initialize(Native Method)
	        at com.aj.ssl.server.SSLServer.main(SSLServer.java:235)

# 引发错误
这个问题去年就解决过一次,但是由于没有记录,而且这个错误报得很宽泛.没想到再次入坑.

按照[官网的文档][1],使用tomcat启用apr和native成功,没错,到这里基本满足apr的需求了,问题是我们需要使用自定义的Openssl Engine啊,于是把`/tomcat/conf/server.xml`中的

	<Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />

改为

	<Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="engineID" />

这时错误出现了.

按照字面意思 ,是说SSL.initialize这个函数没有本平台的实现.我只能承认被这句话忽悠了,这个错误跟平台并没有卵关系,根据我的经验,只要是initialize这个函数出错,报的八成是这个错误(事实上我已经接近真相了)

# 定位原因
无奈之下,只能跟进源码,我对linux开发调试的工具链玩得不是很溜,只能用原始的print大法,其中心酸不足外道矣.一次跟进:

* tomcat-native/jni/native/java/org/apache/tomcat/jni/socket/SSL.java
* tomcat-native/jni/native/src/ssl.c
	* `TCN_IMPLEMENT_CALL(jint, SSL, initialize)(TCN_STDARGS, jstring engine)`
* tomcat-native/jni/native/src/ssl.c
	* `static ENGINE *ssl_try_load_engine(const char *engine)`
	* `ENGINE *e = ENGINE_by_id("dynamic");`

最终定位到的这句代码惊了我个呆, dynamic这个engine是openssl内置的啊,而且作用也比较特殊,因为其他的engine也是需要通过他来加载的.

然而通过一顿眼花缭乱的openssl engine测试,发现并无异常.所以,情况是:

* Apr安装无误
* Native安装无误
* Openssl测试无误
* Native`ENGINE_by_id("dynamic")`报错

# 真正的原因
所以,正确的描述应该是: 在Native中无法调用`ENGINE_by_id`.那么就是内置的引擎没有加载咯?再次检查时终于在`ssl.c`中发现了这么一句:

	#if HAVE_ENGINE_LOAD_BUILTIN_ENGINES
	    ENGINE_load_builtin_engines();
	#endif

擦,意思是你默认不加载,非要定义`HAVE_ENGINE_LOAD_BUILTIN_ENGINES`这么个宏才行咯.

# 解决
接下来就简单了,编译tomcat-native时,加上`HAVE_ENGINE_LOAD_BUILTIN_ENGINES`这个宏就OK了,小宏你隐藏得这么深你爹怎么不写进文档啊!?

	./configure \
	        CFLAGS="-DHAVE_ENGINE_LOAD_BUILTIN_ENGINES $CFLAGS" \
	        --with-apr=/usr/bin/apr-1-config \
	        --with-java-home=$JAVA_HOME \
	        --with-ssl=yes \
	        --prefix=$CATALINA_HOME

再见.

[1]:	http://tomcat.apache.org/native-doc/