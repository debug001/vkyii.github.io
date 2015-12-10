---
layout: post
title: Android逆向开发环境
category: 安卓
tags: 
keywords: 
description: 
---

# 背景
想进行Android的逆向开发,作了少许尝试,稍微整理一下.

# 方案们
* 所有的虚拟机方案,都有可能存在像微信封号之类的问题

## 1. Mac + Genymotion + Android5.\*
这个方案应该算是目前最合理的一个方案,公司配发的Mac电脑,配置现在看来有点低,但是勉强可以做这方面的开发,比起需要开两个虚拟机的Window驱动开发要好多了,但是目前有最坑爹的一个坎过不了:Genymotion架构是x86的,而我大部分需要操作的对象是arm的,跑不起来,只有等Arm-Translation补丁出来以后才能操作了

## 2. Mac + Genymotion + Android4.\*
这个方案可以弥补上个方案的缺点,开发过程OK,唯一的问题是版本可能会滞后,对Android5.\*的机型需要做更多测试,而且像Xposed这样的好工具,可能会用不上他的新特性

## 3. Mac + PD + Windows + BlueStack + Android5.\*
这个方案比较好性能了,虚拟机里面开虚拟机,目测可行性不是很高,如果太卡的话,对开发的限制就太大了.

## 4. Windows + BlueStack + Android5.\*
需要一个新电脑,在Windows下的选择就多了很多了,成本增加比较高

## 5. Mac + HTC(Android5.0)
我正在使用的Android手机,问题是可能ROOT不了

## 6. Mac + Android5.\*真机测试机
* 一个新机成本
* 如果在公司调试,需要Mac地址加入

# 结论
按可行性排序: 

	5 > 1 > 2 > 6 > 4 > 3 
如果_1_的Arm支持可以的话是仅次于_5_的一个方案,否则就是不可行的方案
