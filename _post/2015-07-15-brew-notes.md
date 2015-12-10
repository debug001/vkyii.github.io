---
layout: post
title: brew笔记
category: 备忘
tags: Brew
keywords: 
description: 
lastupdate: 2015-07-27
---

# 速度
安装一些比较大的包的时候,通常会比较慢,这时候可以考虑手动下载好源码包,在进行安装(以mysql为例)

* 查看需要下载什么包:
		 
		brew edit mysql
* 下载
	 
		wget https://cdn.mysql.com/Downloads/MySQL-5.6/mysql-5.6.25.tar.gz
* 转移到HomeBrew的Caches目录

		mv mysql-5.6.25.tar.gz /Library/Caches/Homebrew/
* 进行安装步骤
	 
		brew install mysql

# 代理
经常碰到下载github或googlecode的东西的时候卡住,这时候需要用到代理,试过设置`http_proxy`和`https_proxy`,没有效果

而这个有效:

	ALL_PROXY=socks5://127.0.0.1:8016 brew dosomething
	fdsa