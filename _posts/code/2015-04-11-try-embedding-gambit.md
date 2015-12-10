---
layout: post
title: C++内嵌gambit的尝试
category: 语言
tags: Scheme
keywords: 
description: 
---

花了好几个小时查阅资料,官方文档也浏览了好几遍,结果是令人振奋的:

* gambit代码可以转换成C代码,进而编译为可执行文件或者动态链接库,所以可以直接混编
* 可以解释执行,或者编译为动态库来执行,热更新不成问题
* 简直不能更酷了

## 参考
* [http://asivitz.com/posts/running\_gambit\_scheme\_on\_ios][1]
* [http://jlongster.com/s/jlongster-old/pages/blog/write-apps-iphone-scheme.html][2]

[1]:	http://asivitz.com/posts/running_gambit_scheme_on_ios
[2]:	http://jlongster.com/s/jlongster-old/pages/blog/write-apps-iphone-scheme.html