---
layout: post
title: C#Winform同时显示控制台和窗体
category: 语言
tags: CSharp
keywords: 
description: 
---

程序要求使用Windows消息接受数据,然而我并不想做成窗口程序,因为功能很简单完全没有必要,一些基本的测试希望敲几行命令搞定(最近越来越适应命令行了).

查阅了一会资料,解决方法超级简单:

* 方法1:
	* 建立winform程序,但是属性更改为控制台输出
* 方法2:
	* 建立console程序,添加`System.Windows.Forms`应用

		static void Main(string[] args)
		{
			Application.EnableVisualStyles();
			Application.Run(new Form()); // or whatever
		}

## 参考
[http://stackoverflow.com/questions/277771/how-to-run-a-winform-from-console-application][1]

[1]:	http://stackoverflow.com/questions/277771/how-to-run-a-winform-from-console-application