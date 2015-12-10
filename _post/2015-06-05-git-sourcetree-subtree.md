---
layout: post
title: SourceTree子树一个隐晦的问题
category: 备忘
tags: Git
keywords: 
description: 
---

一直不大习惯命令行,要记的东西多,之前用SourceTree做子树也没出什么错,今天就一直拉不下来,而且一直提示:

	Working tree has modifications. Cannot add.

话不多说,直接丢进Google一顿搜,发现都是很复杂的命令行解法,而且看起来跟我的情况也不是很符合,直到看到有人说了一句[maybe something uncommit][1],这不正是错误提示最有可能的一种情况吗.但是SourceTree的所有分支看起来都是干净的啊

无奈之下开启命令行行

	git status

竟然发现有多个文件处于`typechange`状态,也是见了鬼了,果然提交(commit)以后能正常拉取了

[1]:	http://a0726h77.blogspot.jp/2014/11/git-subtree-working-tree-has.html