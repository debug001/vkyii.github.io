---
layout: post
title: Git worktree和blog结合的小用法
category: 备忘
tags: Git
keywords: 
description: 
---

## 分支结构
**[TODO]**

## 步骤
```shell
# clone jekyll blog代码
git clone https://github.com/vkyii/vkyii.github.io.git
# 建立public和private两个worktree
git worktree add -b post/public _public origin/post/public
git worktree add -b post/private _private origin/post/private
```