---
layout: post
title: Python中转码失败
category: 语言
tags: Python
keywords: 
description: 
---

一般python3从文件或者从网络上取得的内容都是以bytes的形式呈现,如果要能直观地看到内容,特别是字符串的内容,通常都需要decode为string,而我遇到的大部分异常或者错误,都是可以用不同的转码解决的:

# 像
* 'gb2312' codec can't decode byte 0x95 in position 0: illegal multibyte sequence
* 'utf-8' codec can't decode byte 0xd6 in position 0: invalid continuation byte

这就要疯狂地更换转码方式了

# 如
* utf-8
* gbk
* gb2312
* gb18030
* [更多][1]

[1]:	http://www.crifan.com/character_encoding_charset_simpile_tutorial/