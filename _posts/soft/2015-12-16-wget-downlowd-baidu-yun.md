---
layout: post
title: 使用wget下载百度云文件
category: 备忘 
tags: 软件
keywords: 
description: 
---

## 获取cookie
* 安装chrome的**cookies.txt**插件
* 进入yun.baidu.com找到要下载的文件,点击下载,获得下载地址.(chrome打开的下载就取消掉)
* 使用cookies.txt插件下载cookies.txt
* wget -c --load-cookies=cookies.txt "下载地址" -O "文件名" 

## 参考
<http://www.qisanfen.com/?p=442>