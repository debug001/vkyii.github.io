---
layout: post
title: 端口转发
category: 备忘 
tags: Linux
keywords: 
description: 
---

## iptables

	#!/bin/sh
	/sbin/iptables  -t nat -F
	echo 1 > /proc/sys/net/ipv4/ip_forward
	/sbin/iptables -t nat -A PREROUTING -p tcp  --dport 443 -j DNAT --to 192.168.1.117:443
	/sbin/iptables -t nat -A POSTROUTING -j MASQUERADE
	/sbin/iptables -t nat -L -n