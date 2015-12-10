---
layout: post
title: The Little Scheme笔记
category: 语言
tags: Scheme
keywords: 
description: 
---

# (1. Toys)
几个基本概念和常用函数

* `atom` 原子,基本元素之一
* `list` 列表,基本元素之一
* `quote` 即”\`”, 使用时不会直接对quote表达式内容求值
* `car` 求列表的第一个元素,仅对列表有效
* `cdr` 求列表的从第二个元素开始的子列表,仅对非空列表有效
* `cons` 将第一个参数插入到第二个参数(列表型)第一位,并返回新列表
* `null?` 判断列表是否为空,仅对列表有效
* `atom?` 判断参数是否为原子量
* `eq?` 判断两个非数字原子是否相同,应该是比较值而不是指针

# (2. Do It, Do It Again, and Again, and Again…)