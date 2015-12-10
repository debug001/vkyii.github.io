---
layout: post
title: Python3的一个本地import问题
category: 语言
tags: Python
keywords: 
description: 
---

## 问题

在PyCharm里面import一个子目录,总是会出现红色警告.

虽然运行没有问题,但是有警告总是觉得膈应,而且不能直接跳转到实现就简直不能忍了.

解决办法是,把上级目录设置为`source directory`即可.

## 参考

<http://stackoverflow.com/questions/16981921/relative-imports-in-python-3>

<http://stackoverflow.com/questions/21236824/unresolved-reference-issue-in-pycharm>
