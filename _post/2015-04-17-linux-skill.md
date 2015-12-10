---
layout: post
title: Linux笔记
category: 备忘
tags: Linux
keywords: 
description: 
---

## 查看.a/.so导出函数
* `nm libXX.a`
* `nm -D libXX.so`

## .a转换为.so
* `ar -x mylib.a`
* `gcc -shared *.o -o mylib.so`