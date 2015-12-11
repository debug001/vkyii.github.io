---
layout: post
title: Nginx代理设置
category: 
tags: Nginx
keywords: 
description: 
---

## 环境

[alpine linux](http://alpinelinux.org/)

## 安装Nginx

	apk -U add nginx
	
		
## nginx基本目录
* 页面目录: /usr/share/nginx/html
* 配置目录: /etc/nginx
	
## nginx基本命令

	#启动
	nginx -c /etc/nginx/nginx.conf
	# fast shutdown
	nginx -s stop
	# graceful shutdown 
	nginx -s quit
	# reloading the configuration file
	nginx -s reload
	# reopening the log files
	nginx -s reopen
	# 重新加载配置
	nginx -t -c /usr/local/nginx/conf/nginx.conf 
	
## nginx基本配置(/etc/nginx/nginx.conf)
