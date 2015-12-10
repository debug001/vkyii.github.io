---
layout: post
title: Linux下更新软件
category: 备忘
tags: Linux
keywords: 
description: 
---

## 首选方式当然是\_yum_/\_apt-get_

## 如果\_yum\_或\_apt-get\_不能更新到你想要的版本,一般情况下只需要这么做:
	wget http://soft-you-want-upgrade-version.tar.gz
	tar xvfvz autoconf-2.69.tar.gz
	cd autoconf-2.69
	./configure
	make
	sudo make install

## 更多的情况是需要做额外的工作,如修正bin链接等,这就需要根据软件包而定了

## 更新openssl
以CentOS6.6 + openssl-1.0.1l.tar.gz为例:
	sui///
	yum install zlib zlib-devel

	wget ftp://ftp.openssl.org/source/openssl-1.0.1l.tar.gz
	tar –xzvf openssl-1.o/0.1l.tar.gz 
	cd openssl-1.0.1l
	./config shared zlib
	make
	make install
	mv /usr/bin/openssl /usr/bin/openssl.OFF
	mv /usr/include/openssl /usr/include/openssl.OFF
	ln –s /usr/local/ssl/bin/openssl /usr/bin/openssl
	ln –s /usr/local/ssl/include/openssl /usr/include/openssl
	echo "/usr/local/ssl/lib" >> /etc/ld.so.conf
	ldconfig –v
	openssl version –a