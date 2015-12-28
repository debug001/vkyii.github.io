---
layout: post
title: CentOS7 网络配置
category: 备忘 
tags: Linux
keywords: 
description: 
---

## 配置文件

     vi /etc/sysconfig/network-scripts/ifcfg-enp2s0
     
     BOOTPROTO=dhcp
     ONBOOT=yes     # 自动DHCP