---
layout: post
title: 尝试Node.js
category: 语言
tags: [JavaScript,Node]
keywords: 
description: 
---

# 安装
	brew install nodejs

# 新建*express*项目
安装express生成器
	npm install express-generator -g

检查版本号
	express -h

建立一个名为*server*的项目
	express server

进入此项目目录
	cd server/

安装所有依赖
	npm install

调试方式启动
	DEBUG=server ./bin/www