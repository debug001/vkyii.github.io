---
layout: post
title: diff+patch用法小试
category: 备忘
tags: Tool
keywords: 
description: 
---

# 背景
经常碰到使用开源工具的问题,比如SublimeText的插件,一些小需求,只有自己用到,做了一些修改,得小心翼翼记录下来,以防下次安装时出现各种蛋疼的问题.

今天尝试一下使用diff+patch来处理这个问题

# diff
diff可以比较文件/目录,并记录区别,基本用法:
> diff [选项] 源文件(夹) 目的文件(夹)

* -r
递归。设置后diff会将两个不同版本源代码目录中的所有对应文件全部都进行一次比较，包括子目录文件。
* -N
选项确保补丁文件将正确地处理已经创建或删除文件的情况。
* -u
输出每个修改前后的3行，也可以用-u5等指定输出更多上下文。
* -E, -b, -w, -B, --strip-trailing-cr
忽略各种空白，可参见文档，按需选用。

# patch
patch的作用则是将diff记录的结果（即补丁）应用到相应文件（夹）上。最常见的用法为：
> patch -pNUM <patchfile>

* -p Num
忽略几层文件夹，随后详解。
* -E
选项说明如果发现了空文件，那么就删除它
* -R
取消打过的补丁。

# 使用
给OmniMarkupPreviewer打个补丁

```shell
# Sublime3DIR=~/Library/Application\ Support/Sublime\ Text\ 3

# 制作文件补丁
diff $(Sublime3DIR)/Packages/OmniMarkupPreviewer/OmniMarkupLib/RendererManager.py ./RendererManager.py > RendererManager.py.patch
# 应用文件补丁
patch $(Sublime3DIR)/Packages/OmniMarkupPreviewer/OmniMarkupLib/RendererManager.py < RendererManager.py.patch
# 取消文件补丁
patch $(Sublime3DIR)/Packages/OmniMarkupPreviewer/OmniMarkupLib/RendererManager.py < RendererManager.py.patch -R

# 制作文件夹补丁
diff $(Sublime3DIR)/Packages/OmniMarkupPreviewer $(DIR)/SublimeText3/OmniMarkupPreviewer  > $(DIR)/SublimeText3/Patch/OmniMarkupPreviewer.patch -rupN
# 应用文件夹补丁
patch -d $(Sublime3DIR)/Packages/OmniMarkupPreviewer -p0 < $(DIR)/SublimeText3/Patch/OmniMarkupPreviewer.patch
# 取消文件夹补丁
patch -d $(Sublime3DIR)/Packages/OmniMarkupPreviewer -p0 < $(DIR)/SublimeText3/Patch/OmniMarkupPreviewer.patch -R
```

# 参考
[补丁(patch)的制作与应用]("http://linux-wiki.cn/wiki/zh-hans/%E8%A1%A5%E4%B8%81(patch)%E7%9A%84%E5%88%B6%E4%BD%9C%E4%B8%8E%E5%BA%94%E7%94%A8")