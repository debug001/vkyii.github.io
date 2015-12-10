---
layout: post
title: 使用WingIDE调试IDAPython脚本
category: 备忘
tags: [Python,IDA]
keywords: 
description: 
---
# 环境
* Windows7
* IDA6.6
* WingIDE5.1.2

# 步骤
* 其实[官网][1]的说明已经比较清楚,可惜视频被墙了
* 从WingIDE目录下拷贝_wingdbstub.py_到IDA\_Dir/python
	* WINGHOME指向WingIDE目录
	* kEmbedded设置为0
* 新建脚本(或已有的脚本)IDA\_Dir/Python/test.py,加入以下代码,这个模块用于发起调试,这两句代码后下断可调
		import wingdbstub
		wingdbstub.Ensure()
* 打开WingIDE,左下角的小虫图标
	* 勾选_Accept Debug Connections_
* 打开IDA,File-\>Script File-\>test.py,WingIDE应该能断下了

[1]:	https://wingware.com/doc/howtos/idapython