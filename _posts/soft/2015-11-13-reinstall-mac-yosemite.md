---
layout: post
title: 重装了Mac系统
category:
tags: Mac
keywords:
description:
---

# 安装系统
* 重启系统是`CMD+R`进入恢复模式
* 磁盘工具 => 抹盘 => 退出磁盘工具
* 重新安装系统 => 加入无线网络 => 在线安装(时间视网速不同)

# 常用软件

## HomeBrew
[地址](http://brew.sh/)

	touch ~/.bashrc
	echo "export HOMEBREW_GITHUB_API_TOKEN=6b3d4908a0db7bbcab2699b24452bb71ef68d127" >> ~/.bashrc
	brew tap caskroom/versions
	
### 更换镜像源
	cd /usr/local
	//二者选其一即可更新
	//清华镜像源
	git remote set-url origin git://mirrors.tuna.tsinghua.edu.cn/homebrew.git
	//中科大镜像源
	git remote set-url origin http://mirrors.ustc.edu.cn/homebrew.git
	
	// 后续操作
	cd ~
	mkdir tmp
	cd tmp
	//以下要与你选择的镜像源相同
	git clone git://mirrors.tuna.tsinghua.edu.cn/homebrew.git
	git clone http://mirrors.ustc.edu.cn/homebrew.git
	
	sudo rm -rf /usr/local/.git
	sudo rm -rf /usr/local/Library
	sudo cp -R homebrew/.git /usr/local/
	sudo cp -R homebrew/Library /usr/local/
	
	// 排错
	//确保目录归属管理组
	sudo chgrp -R admin /usr/local
	//确保管理组可读
	sudo chmod -R g+w /usr/local

### cask 及常用软件
	brew install caskroom/cask/brew-cask 
	brew cask install qq 
	brew cask install qqmacmgr
	brew cask install sourcetree 
	brew cask install macdown 
	brew cask install xiami 
	brew cask install the-unarchiver
    brew cask install key-codes
	
## sublime
	brew cask install sublime-text3
	ln -s "/opt/homebrew-cask/Caskroom/sublime-text3/Build 3083/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

## python
	brew install pyenv
	pyenv install 3.5.0
	# env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.5.0
	# zipimport.ZipImportError: can't decompress data; zlib not available
	# xcode-select --install
	pyenv global 3.5.0
	pyenv rehash
	echo 'eval "$(pyenv init -)"' >> ~/.bashrc
	# ~/.pyenv/cache 默认缓存目录,下载速度慢时可手动下载到这里再pyenv install

### 更换pip源
	# http://pypi.douban.com/  豆瓣
	# http://pypi.hustunique.com/  华中理工大学
	# http://pypi.sdutlinux.org/  山东理工大学
	# http://pypi.mirrors.ustc.edu.cn/  中国科学技术大学
	# pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com numpy
	
## ruby
	brew install rbenv
	rbenv install 2.2.3
	echo 'eval "$(rbenv init -)"' >> ~/.bashrc
	source ~/.bashrc
	rbenv global 2.2.3
	rbenv rehash
	
### 更换gem源为淘宝源
	gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
	
## php
	brew install automake autoconf curl pcre re2c mhash libtool icu4c gettext jpeg libxml2 mcrypt gmp libevent
	brew link icu4c
	curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
	chmod +x phpbrew
	sudo mv phpbrew /usr/bin/phpbrew
	phpbrew init
	echo "source $HOME/.phpbrew/bashrc" >> ~/.bashrc
	phpbrew known
	phpbrew install 5.6.15

## jekyll
	gem install jekyll
	gem install jekyll-paginate
	gem install redcarpet

## ohmyz
[地址](http://ohmyz.sh/)

	# 安装zsh
	brew cask install zsh
    # 安装oh-my-zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    # 自动补全失效时:
    compaudit | xargs chmod g-w
    compaudit | xargs chown root
	rm -f ~/.zcompdump; compinit
    # 安装powerline(增强命令行的显示)
	pip install powerline-status
	pip show powerline-status
	# 下面这个目录要根据powerline-status的结果来调整
	echo ". /Users/vkyii/.pyenv/versions/3.5.0/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh" >> ~/.bashrc
	# 安装powerline的字体
	git clone https://github.com/powerline/fonts.git
	cd fonts
	./install.sh
	curl -fsSL https://github.com/abertsch/Menlo-for-Powerline/archive/master.zip

## iterm2
	brew cask install iterm2
	# 下载配色
	curl -fsSL https://github.com/mbadolato/iTerm2-Color-Schemes/archive/master.zip
	# 自动登录SSH
	brew install https://raw.github.com/eugeneoden/homebrew/eca9de1/Library/Formula/sshpass.rb
	/usr/local/Cellar/sshpass/1.05/bin/sshpass -p password ssh -o StrictHostKeychecking=no root@115.28.147.152

### 进一步的配置
    * CTRL + ,
    * 新建一个Profile,名为HotKey
    * Keys -> HotKey
        * Show/Hide iTerm2 with a system-wide hotkey
            * 设置一个快捷键,如CMD+Space
        * HotKey toggles a dedicated window with profile
            * 选择'HotKey'这个Profile
    * 修改快捷键
        * 很多默认快捷键,软件不提供修改方法,可以自己改.
        * 系统偏好设置 -> 键盘 -> 快捷键 -> 应用快捷键.
        * 选择Vim.app
        * 增加或修改快捷键,需要与软件里显示的名字完全一致,包括中文.
    
## Vim
    brew install vim --with-lua
    # Macvim依赖于XCode,先从AppStore安装,再同意其license
    brew install macvim --with-override-system-vim --with-lua
    brew linkapp macvim

## proxychains + shadowsocks
	brew cask install shadowsocksx
	brew install proxychains-ng
	
	
推荐配置(**/usr/local/Cellar/proxychains-ng/4.10/etc/proxychains.conf**)
	
	strict_chain
	proxy_dns 
	remote_dns_subnet 224
	tcp_read_time_out 15000
	tcp_connect_time_out 8000
	localnet 127.0.0.0/255.0.0.0
	quiet_mode
	
	[ProxyList]
	socks5  127.0.0.1 1080
	
	
使用:

	proxychains4 curl https://www.twitter.com/
	proxychains4 git push origin master
	
## alfred
[查词](https://github.com/liberize/alfred-dict-workflow)
[显隐隐藏文件](https://github.com/BubiDevs/manage-hidden-files)
[结束进程](https://github.com/ngreenstein/alfred-process-killer)
[Package Managers Workflow](https://github.com/willfarrell/alfred-pkgman-workflow)

	
## 非brew
* appcleaner 用来快速清理不用的APP


## 字体(中英文等宽)
[Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html)
[iosevka](https://github.com/be5invis/Iosevka)
[UbuntuMono](http://font.ubuntu.com/)
[温泉驿](http://wenq.org/wqy2/index.cgi?Download#ZenHei_Stable)

## 参考

[brew update 慢 解决办法 镜像更新源](https://www.logcg.com/archives/1301.html)

[use-phpbrew-virtphp](http://www.sitepoint.com/use-phpbrew-virtphp)

[phpbrew git](https://github.com/phpbrew/phpbrew)

[proxychains+shadowsocks神器](http://shawnelee88.github.io/2015/07/10/proxychains-shadowsocks%E7%A5%9E%E5%99%A8/)
