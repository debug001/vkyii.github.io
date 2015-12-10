---
layout: post
title: Linux查看端口是否被占用
category: 备忘
tags: Linux
keywords: 
description: 
---

	netstat  |grep :12312 |wc -l
	lsof -n -P| grep :12312
	lsof -P | grep 'php' |  grep ':12312' | awk '{print $2}' | xargs kill -9