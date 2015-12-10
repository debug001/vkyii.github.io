---
layout: post
title: 使用ADB从Android手机拷贝文件
category: 安卓
tags: [python, adb]
keywords: 
description: 
---

# 代码
	import os
	for i in range(829, 945):
		cmd = 'adb -s CC53FYG07173 pull /storage/sdcard0/DCIM/100MEDIA/IMAG0{}.jpg .'.format(i)
		os.system(cmd)
