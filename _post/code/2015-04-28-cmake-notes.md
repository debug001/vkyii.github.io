---
layout: post
title: CMake笔记
category: 备忘
tags: Make
keywords: 
description: 
---

## include\_directories
相当于附加包含目录(-I)

## link\_directories
相对于附加包含库目录(-L)

## target\_link\_libraries
这个比较坑爹,注意几个点:

* 需要放在*add_executable*或*add_library*后面
* 如果静态库链接静态库,如`add_library(lib1 STATIC lib2)`,此时lib1是不会将lib2的符号链接进去的,[这里][1]有人作出了解释,但是在我印象里,VS是不会把lib2链接进lib1,反倒是gcc可以,但是这也不是重点,重点是_只有在生成动态链接库或者可执行文件时,才会把这些静态库链接进去_

[1]:	http://stackoverflow.com/questions/18347235/linking-a-static-boost-build-into-a-static-library-under-vs2012-win32-64/18351904#18351904