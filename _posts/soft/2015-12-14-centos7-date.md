---
layout: post
title: CentOS7 设置系统时间
category: 备忘 
tags: Linux
keywords: 
description: 
---

## 设置为中国区同步

	yum install ntp //安装ntp服务
	systemctl enable ntpd //开机启动服务
	systemctl start ntpd //启动服务
	timedatectl set-timezone Asia/Shanghai //更改时区
	timedatectl set-ntp yes //启用ntp同步
	ntpq -p //同步时间
	
	
## 参考

[CentOS 7 时间, 日期设置](http://blog.itnmg.net/centos-7-time-date/)