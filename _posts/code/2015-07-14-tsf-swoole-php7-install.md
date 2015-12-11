---
layout: post
title: php7+swoole+tsf安装记
category: 备忘
tags: Linux
keywords: 
description: 
---

# 环境
MacOS + brew

# php7
> [git-src][1]  
> [homebrew-php][2]

尝试了源码编译,在openssl这步出错了,可能是因为我的openssl是由brew安装的原因,不再纠结,转而php也用brew安装,参考[这里][3],如果出错,可能是某些步骤需要sudo

	brew tap homebrew/dupes
	brew tap homebrew/versions
	brew tap homebrew/homebrew-php
	brew options php70
	brew install php70

`brew install php70`这步用遇到了openssl的问题,但是这次提示比较明确:\_another version is already linked\_,总之就是版本不对头,升级一下即可

	sudo chown -R $USER /usr/local
	brew upgrade openssl

再次`brew install php70`后成功

# swoole
> [git-src][4] 

同样是安装最新版,目前是1.1.18rc1

	wget https://github.com/swoole/swoole-src/archive/swoole-1.7.18-rc1.tar.gz
	tar -zxvf swoole-1.7.18-rc1.tar.gz
	cd swoole-src-swoole-1.7.18-rc1
	phpize
	./configure
	make
	make install

编辑`/usr/local/etc/php/7.0/php.ini`,加入`extension=swoole.so`,以自动加载swoole插件

# tsf
> [git-src][5]


[1]:	https://github.com/php/php-src
[2]:	https://github.com/Homebrew/homebrew-php
[3]:	https://github.com/Homebrew/homebrew-php
[4]:	https://github.com/swoole/swoole-src
[5]:	https://github.com/tencent-php/tsf