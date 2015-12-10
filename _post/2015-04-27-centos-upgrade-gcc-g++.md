---
layout: post
title: CentOS下的工具升级
category: 备忘
tags: Linux
keywords: 
description: 
---

# gcc-c++
默认情况下 `yum install gcc gcc-c++` 一般centos这个默认会装成4.4.7的版本太低不支持C++11

	//安装老版本的gcc和g++
	yum install -y gcc
	yum install -y gcc-c++
	yum install -y glibc-static 
	//yum install -y libstdc++-static
	
	//下载文件:
	wget -c http://mirror.hust.edu.cn/gnu/gcc/gcc-4.9.2/gcc-4.9.2.tar.gz
	
	//解压缩
	tar -zxvf gcc-4.9.2.tar.gz
	
	//创建目录：编译目录和安装目录
	cd gcc-4.9.2
	mkdir build
	mkdir /usr/local/gcc-4.9.2
	mkdir /usr/local/gcc
	
	//下载gmp，mpfr，mpc源码（可以不手动编译）
	./contrib/download_prerequisites
	
	//配置：选择安装目录以及编译的语言
	cd build
	../configure   --prefix=/usr/local/gcc-4.9.2 --exec-prefix=/usr/local/gcc --enable-languages=c,c++ --with-mpc --disable-multilib --enable-checking=release --enable-bootstrap
	
	//编译,如果 u 的 cpu 是四核的话，可以 make -j4 加速编译
	make 
	
	//安装
	make install
	
	//环境变量
	export PATH=/usr/local/gcc/bin:$PATH
	ln -s /usr/local/gcc-4.9.2/include/c++/4.9.2 /usr/include/c++/4.9.2
	export CPLUS_INCLUDE_PATH=/usr/include/c++/4.9.2:/usr/include/c++/4.9.2/x86_64-unknown-linux-gnu

自己试验了一遍(CentOS6.6),没有成功,不想折腾了,找了个脚本再试一下:

	yum install gcc-c++
	mkdir -p work/gcc
	cd work/gcc
	git clone https://github.com/jlinoff/gcc-4.9.2-boost-1.57.git 4.9.2
	cd 4.9.2
	
	//注释掉boost的下载链接,这里需要gcc,不需要boost,并加上--disable-multilib的configure选项
	vi bld.sh
	su
	chmod a+x bld.sh
	make
 

编译成功后(到了Test这步就已经编译成功了,因为Boost没有编译,所以会卡在test9这步)设置环境变量,使新的gcc/g++生效,编C辑.bashrc,增加:

	RTFDIR="/home/user/work/gcc/4.9.2/rtf"
	export PATH="${RTFDIR}/bin:${PATH}"
	export LD_LIBRARY_PATH="${RTFDIR}/lib:${RTFDIR}/lib64:${LD_LIBRARY_PATH}"
	export CPLUS_INCLUDE_PATH="${RTFDIR}/include/c++/4.9.2:${RTFDIR}/include/c++/4.9.2/x86_64-unknown-linux-gnu"

另外,Clion是直接扫描/usr/bin/c++为C++代码的编译程序,需要额外的指定:

	su
	//备份原来的c++
	mv /usr/bin/c++ /usr/bin/c++.back
	ln -s /home/user/work/gcc/4.9.2/rtf/bin/c++ /usr/bin/c++

## 遇到的问题
* 编译*binutil*时提示_bison is missing on you systerm_,`yum install bison`即可.