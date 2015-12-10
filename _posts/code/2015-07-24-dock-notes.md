---
layout: post
title: docker笔记
category: 备忘
tags: docker
keywords: 
description: 
lastupdate: 2015-08-24
---

# 安装
安装步骤参考[Docker —— 从入门到实践][1]

## Mac安装
	brew cask install boot2docker
	
## 启动
	boot2docker init
	boot2docker up
	$(boot2docker shellinit)
	
## 重启
	boot2docker stop
	boot2docker delete
	boot2docker init
	boot2docker up
	# 如果没有提示环境配置好,就自己配置
	$(boot2docker shellinit)
	
## 有用的命令

删除所有none镜像

	docker rmi -f $(docker images | grep '<none>' | tr -s ' ' | cut -d ' ' -f 3)

删除所有容器

	docker rm -f $(docker ps -a -q)


---- 

# [疑难杂症][2]

## FATA[0000]() Cannot connect to the Docker daemon. Is 'docker -d' running on this host?

看起来是docker服务没有起来,检查一下:

	service docker status
	# docker 已死，但 pid 文件仍存

解决办法:

	yum install device-mapper-event-libs
	service docker restart

## x509: certificate is valid for 192.168.99.103, not 192.168.99.100
参考[这里][4]

	boot2docker ssh 'sudo /etc/init.d/docker restart'

## 端口转发(通常是Connect refuse错误)
参考[这里][5]

	boot2docker ssh -vnNTL 8000:localhost:8000 #ssh port forwording

或者

	VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port8000,tcp,,8000,,8000" # VirtualBox NAT Port forwarding
	VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port8000,tcp,,8000,,8000" # vm is running


# 搭建nginx+rtmp+ffmpeg镜像

## 制作

### 拉取一个基础centos镜像
	docker pull centos:6.6
	# 如果是这个,则会拉取最新版本的centos
	docker pull centos
	
### 进入镜像bash,实践所有RUN脚本([参考][6])
	docker run -idt centos:6.6 /bin/bash
	docker ps
	docker attach container_id


# 加速
默认从hub.docker.com拉取镜像确实比较慢,尝试了一下:
* DaoCloud的镜像加速有次数和流量限制的
* TenxCloud没有提到限制,配置了一下先用着吧

## 配置

	boot2docker ssh
	sudo su
	echo "EXTRA_ARGS=\"--registry-mirror=http://xxxxx.m.tenxcloud.net\"" >> /var/lib/boot2docker/profile && exit
	exit
	boot2docker restart
	 # boot2docker ssh 'sudo /etc/init.d/docker restart'

## 拉取daocloud镜像
最近daocloud.io已显式支持拉取镜像,但是很可能报`FATA[0020] Error response from daemon: Get https://daocloud.io/v1/_ping: dial tcp: i/o timeout`这种错误,解决方法是`docker login daocloud.io`,登录成功以后可以直接拉取了.

若还是出现这个问题,有时多敲几次pull也好使

# 调试

## 标准托管
标准的托管方案是把docker项目托管到github或bitbucket,然后在hub.docker.com建立项目关联,这样每当提交给github时,hub.docker.com那边就会自动构建镜像,并且使用`docker search yourdocker`可以找到(托管到老家了嘛),看起来很完美,但是实际操作的时候是相当崩溃的:
*提交代码到github非常慢非常慢*

## 调试方案
索性不管是代码托管还是docker托管,国内都有替代品,比如coding.net+daocloud,不得不说这个组合的速度是相当快的,可惜先入为主已久,而且daocloud的镜像不知如何单独拉出.

实际操作上,也很简单,在原有的项目上新建一个分支,专门向coding.net的项目提交,在daocloud上也新建项目与coding.net关联,这样,在调试docker的时候:

* 修改代码
* 提交给coding.net分支
* 在daocl上查看镜像编译结果
* 以上重复直到编译成功
* 向github提交最终结果

# 参考
* [Docker —— 从入门到实践][7]

[1]:	http://dockerpool.com/static/books/docker_practice/index.html
[2]:	https://github.com/boot2docker/boot2docker/blob/master/doc/WORKAROUNDS.md
[4]:	https://github.com/docker/machine/issues/531
[5]:	https://github.com/boot2docker/boot2docker/blob/master/doc/WORKAROUNDS.md
[6]:	https://registry.hub.docker.com/u/cris/nginx-rtmp/
[7]:	http://dockerpool.com/static/books/docker_practice/index.html