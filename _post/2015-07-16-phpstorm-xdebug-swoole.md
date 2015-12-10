---
layout: post
title: 使用PhpStorm+XDebug对Swoole进行单步调试
category: 语言
tags: PHP
keywords: 
description: 
---

# 环境
* MacOS
* PhpStorm8.0
* php5.6
* xdebug2.3.3

# 步骤
* 编辑`_php.ini_`(可用`php -i`确定文件位置),加入:

		[xdebug]
		zend_extension="/usr/local/Cellar/php56-xdebug/2.3.3/xdebug.so"
		xdebug.remote_enable =1
		xdebug.remote_handler = "dbgp"
		xdebug.remote_host = "localhost"
		xdebug.remote_mode = "req"
		xdebug.remote_port = 9000
		xdebug.idekey="PHPSTORM"

* 确保`Preference -> PHP -> Debug -> xDebug -> port`与`php.ini`中设置的一致
* 在PhpStorm中新建`Configuration`,类型为`PHP Script`,内容为启动swoole服务
* Start Listening For PHP Debug Connection,右上角的电话开启
* 在浏览器中打开网址,如`127.0.0.1:12312/Test/Test`调试开始 