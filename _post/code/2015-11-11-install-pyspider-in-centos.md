---
layout: post
title: 在CentOS上安装pyspider
category: 语言
tags: Rust
keywords: 
description: 
---

# 运行pyspider出错:
## 错误1
	ImportError: pycurl: libcurl link-time ssl backend (openssl) is different from compile-time ssl backend (none/other)

### 解决方法:

	pip uninstall pycurl
	export PYCURL_SSL_LIBRARY=openssl
	pip install pycurl

## 错误2
	ImportError: pycurl: libcurl link-time ssl backend (nss) is different from compile-time ssl backend (openssl)

### 解决方法

	pip uninstall pycurl
	export PYCURL_SSL_LIBRARY=nss
	pip install pycurl

## 其他解决方法1
	pip uninstall pycurl
	export PYCURL_SSL_LIBRARY=[nss|openssl|ssl|gnutls]
	pip install pycurl

## 其他解决方法2
	curl -O https://pypi.python.org/packages/source/p/pycurl/pycurl-7.19.3.1.tar.gz
	python setup.py --with-[nss|openssl|ssl|gnutls] install

## 错误3
	ImportError: No module named '_sqlite3'

### 解决方法
	yum install sqlite-devel
	pip install pysqlite


