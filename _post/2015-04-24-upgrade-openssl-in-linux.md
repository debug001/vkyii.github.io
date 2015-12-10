---
layout: post
title: Ubuntu下升级openssl
category: 备忘
tags: Linux
keywords: 
description: 
---

## 安装基础编译环境
apt-get  install build-essential

## 编译安装 Zlib 库
wget http://zlib.net/zlib-1.2.5.tar.gz
tar -zxf zlib-1.2.5.tar.gz
cd zlib-1.2.5/
./configure --prefix=/usr/local
make && make install

## 卸载旧版本 OpenSSL
apt-get purge openssl
rm -rf /etc/ssl #删除配置文件

## 编译与安装 OpenSSL
prefix 是安装目录，openssldir 是配置文件目录

wget ftp://ftp.openssl.org/source/openssl-1.0.0c.tar.gz
tar -zxf openssl-1.0.0l.tar.gz
cd openssl-1.0.0l/
./config shared --prefix=/usr/local --openssldir=/usr/local/ssl
make clean
make && make install