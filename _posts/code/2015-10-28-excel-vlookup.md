---
layout: post
title: Excel也能遇到坑
category: 流水
tags: VB
keywords: 
description: 
---

帮小白看个VLookUp的公式,`=VLookUp(T2&U2,IF({1,0},A2:A20&B2:B20,C2:C20),2,FALSE)`竟然只是在同一行时可以正确查找到数据,换一行就N/A,这是何等神奇的错误啊,如果只能在一行我还查找个丁丁啊.

结果给同事演示这个奇葩的错误的时候,竟然奇迹般地成功了,难道是复制粘贴的姿势不对?回到自己电脑前万般尝试未果,正纳闷呢,手贱敲了个`Ctrl+Shift+Enter`,

额,世界安静了.