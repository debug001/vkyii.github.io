---
layout: post
title: Clonezilla笔记
category: 备忘 
tags: 系统备份
keywords: 
description:
---

## 制作USB启动盘
参考[官网](http://clonezilla.org/liveusb.php)

* 到[这里](http://clonezilla.org/downloads/download.php?branch=alternative#download-top)下载clonezilla文件
    1. Select CPU architecture:  amd64  // 64位CPU,支持多核
    2. Select file type:  zip           // USB
    3. 文件为: **clonezilla-live-20151012-wily-amd64**
* 到[这里](http://tuxboot.org/download/)下载tuxboot
* 使用tuxboot制作clonezilla的启动盘,不同于大白菜和U盘大师这种,竟然没有格式化U盘,暂时保持惊讶,经实践,会覆盖之前的启动项.
* 参照[Clonezilla live doc](http://clonezilla.org/clonezilla-live-doc.php)进行备份和恢复.