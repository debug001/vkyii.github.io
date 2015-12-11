---
layout: post
title: Linux报错记录
category: 备忘
tags: Linux
keywords: 
description: 
---

## superblock last mount is in the future
报错大概像这样

	Checking filesystems
	/dev/mapper/vg_1-lv_root : superblock last mount time (jul 1
	now= Jan 1 is in the future.
	/dev/mapper/vg_1-lv_root : UNEXPECTED INCONSISTENCYL RUN fsck MANUALLY

原因是时钟错误,判定上次加载时间在未来,解决方法,把系统时间调整回来:

	date +%Y%m%d -s "20150706"
	reboot
