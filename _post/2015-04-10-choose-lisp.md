---
layout: post
title: 选择一个Lisp
category: 语言
tags: Scheme
keywords: 
description: 
---
## 为什么学Lisp

## 选择哪个方言
Lisp的方言如此之多,五花八门,依重要性需要满足这样几个要求:

* 可以与C相互调用,至少要可以以C为宿主,Lisp作为脚本
* 运行时效率不能太低,至少需要与Lua相当
* 有可靠的开发环境,包括调试链

## 我的选择过程
### 可选池
因为Embedded-C是首要,所以直接从[SWIG][1]支持的几种方言里选择,通用性和可靠性都有所保证.

* MzScheme
* [Racket][2]
* CLisp
* Allegro Common Lisp
* CFFI

另外还有几个自带Embedded-C功能的:

* [Embeddable Common-Lisp][3]
* [Gambit][4]

其他推荐比较多的:
* [Chicken][5]
* [Clojure][6]

### 缩小范围
我只需要一个”纯洁”的脚本,其实Lua已经几乎满足了我的要求,除了那基于栈的实现和我队一个完美语言的探索欲望.  
所以Scheme是一个更好的选择,我不需要更多的语法,关键字,库等等  
于是,可选池变成了:\_MzScheme_, \_Racket_, \_Gambit\_

### 性能
[这里][7]有一个比较直观的性能测试,可见[Gambit][8]略占上风,先学习一下看咯
[这里][9]有一个选择lisp的推荐

[1]:	http://www.swig.org/
[2]:	http://racket-lang.org/
[3]:	http://sourceforge.net/projects/ecls/
[4]:	http://gambitscheme.org/
[5]:	http://www.call-cc.org/
[6]:	http://clojure.org/
[7]:	http://www.iro.umontreal.ca/~gambit/bench.html
[8]:	http://gambitscheme.org/
[9]:	https://pubby8.wordpress.com/2012/03/22/scheme-with-c/