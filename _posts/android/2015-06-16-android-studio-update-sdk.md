---
layout: post
title: Android Studio更新SDK
category: 安卓
tags: 墙
keywords: 
description: 
---

# 编辑hosts文件(Win7: C:\Windows\System32\Drivers\Etc\hosts),加入

	#Google主页  
	203.208.46.146 www.google.com  
	##这行是为了方便打开Android开发官网 现在好像不翻也可以打开  
	74.125.113.121 developer.android.com  
	##更新的内容从以下地址下载  
	203.208.46.146 dl.google.com  
	203.208.46.146 dl-ssl.google.com

# 打开AndroidStudio/Tool/Android/SDK Manager/Tool/Option
强制使用Http

	HTTP Proxy Server: mirrors.neusoft.edu.cn
	HTTP Proxy Port: 80