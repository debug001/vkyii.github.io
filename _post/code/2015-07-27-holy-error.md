---
layout: post
title: 神奇的错误
category: 
tags: docker
keywords: 
description: 
---

# Please install either Subvertpy or the Subversion Python SWIG bindings!
> abort: no compatible bindings available:
> Subversion 1.5.0 or later required, but no bindings were found
> Subvertpy 0.7.4 or later required, but not found
> Please install either Subvertpy or the Subversion Python SWIG bindings!
使用SourceTree拉取GitHub代码时出现的,使用brew解决
	brew install --with-python subversion
	sudo sh -c 'echo /usr/local/lib/svn-python > /Library/Python/2.7/site-packages/subversion.pth'
