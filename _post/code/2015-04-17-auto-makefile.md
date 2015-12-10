---
layout: post
title: Makefile笔记
category: 备忘
tags: [Linux,Make]
keywords: 
description: 
---

# automake链
## 基本步骤
* `autoscan` 生成\_configure.scan\_
* `mv configure.scan configure.ac`
* `vi configure.ac`
	* \_TODO\_细节
* `autoheader` 生成\_ config.h\_
* `aclocal` 生成\_aclocal.m4\_
	* 如果需要自己定义函数,可以`vi acinclude.m4`避免在\_aclocal.m4\_中定义被覆盖掉
* `autoconf`
* `vi Makefile.am`
* `automake`
## 可能出现的问题
* `automake`中出现missing xxx,一般都会提示,使用`automake --add-missing`可搞定
* `alisa libtoolize glibtoolize`解决libtool在Mac下的问题