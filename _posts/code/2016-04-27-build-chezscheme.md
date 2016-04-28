---
layout: post
title: 编译ChezScheme
category: 语言
tags: Scheme
keywords: 
description: 
---

## 缘由
之前被[这篇文章](http://www.yinwang.org/blog-cn/2013/03/28/chez-scheme)安利,一直持有向往,玩了一段时间gambit后就搁置了.今天偶然发现ChezScheme已然开源,按耐不住想尝试一下.

## build
```shell
# 先下载源码
git clone https://github.com/cisco/ChezScheme.git
cd ChezScheme
./configure
sudo make install

# 使用
man scheme
scheme
```

## 所遇错误

* `fatal error: 'X11/Xlib.h' file not found`

	[文档](https://github.com/cisco/ChezScheme/blob/master/BUILDING)里已经提到
	> Prerequisites:

	> * GNU Make
	> * gcc
	> * Header files and libraries for ncurses
	> * Header files and libraries for X windows
	
	这错误大概是没有安装X11的意思,而Max10.8之后已经不带X11,所以得自己去安装一个

```shell
brew cask install xquartz
```

再重新*build*应该可以了.