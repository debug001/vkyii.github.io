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

## usb不可写
* 报`Read-only file system`
* sudo mount -o remount,rw '/path/to/mount/sub'