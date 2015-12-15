---
layout: post
title: Nginx代理设置
category: 
tags: Nginx
keywords: 
description: 
---

## 环境

[alpine linux](http://alpinelinux.org/)

### 防火墙

	apk -U add iptables
	rc-update add iptables  		# 开机启动
	/etc/init.d/iptables save		# 保存配置
	
	# 开启80端口
	iptables -A INPUT -p tcp -m tcp --sport 80 -j ACCEPT
	iptables -A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT
	
	# 开启443端口
	iptables -A INPUT -p tcp -m tcp --sport 443 -j ACCEPT
	iptables -A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT
	
	# 重启
	/etc/init.d/iptables save
	service iptables restart


## 安装Nginx

	apk -U add nginx
	
		
## nginx基本目录
* 页面目录: /usr/share/nginx/html
* 配置目录: /etc/nginx
	
## nginx基本命令

	#启动
	nginx -c /etc/nginx/nginx.conf
	# fast shutdown
	nginx -s stop
	# graceful shutdown 
	nginx -s quit
	# reloading the configuration file
	nginx -s reload
	# reopening the log files
	nginx -s reopen
	# 重新加载配置
	nginx -t -c /usr/local/nginx/conf/nginx.conf 
	
## nginx基本配置(http)(/etc/nginx/nginx.conf)

	http {
		include       mime.types;
		default_type  application/octet-stream;
	
		#log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
		#                  '$status $body_bytes_sent "$http_referer" '
		#                  '"$http_user_agent" "$http_x_forwarded_for"';
	
		#access_log  logs/access.log  main;
	
		sendfile        on;
		#tcp_nopush     on;
	
		#keepalive_timeout  0;
		keepalive_timeout  65;
	
		# HTTP Server
		server {
			listen       80;
			server_name  localhost;
	
			#charset koi8-r;
	
			#access_log  logs/host.access.log  main;
	
			location / {
				root   html;
				index  index.html index.htm;
			}
	
			# 代理单个页面
			location /test {
				proxy_pass http://192.168.1.48:8080/test.html; 
				proxy_set_header Host $host;  
				proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			}
	
			# 代理一个目录
			# from: http://192.168.1.48:8080/dir1/test.html
			#   to: http://192.168.3.116:80/dir1/test.html
			location ~* ^/dir1/.*$ {
				proxy_pass http://192.168.1.48:8080;
			}
			#error_page  404              /404.html;
	
			# redirect server error pages to the static page /50x.html
			#
			error_page   500 502 503 504  /50x.html;
			location = /50x.html {
				root   html;
			}
		}
		
		# HTTPS server
		server {
			listen       443;
			ssl on;
			server_name  localhost;
		
			ssl_certificate      /root/https/localhost.crt;
			ssl_certificate_key  /root/https/localhost.key;
		
			#    ssl_session_cache    shared:SSL:1m;
			#    ssl_session_timeout  5m;
		
			#    ssl_ciphers  HIGH:!aNULL:!MD5;
			#    ssl_prefer_server_ciphers  on;
			location / {
				# root   html;
				# index  index.html index.htm;
				proxy_pass https://192.168.1.117:443;
				proxy_set_header Host $host:443;
				proxy_set_header X-Real-IP $remote_addr;
				proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
				proxy_set_header Via "nginx";
			}
		}
	}
	
	
## nginx基本配置(https)(/etc/nginx/nginx.conf)

    # HTTPS server
    server {
       listen       443 ssl;
       server_name  localhost;

       ssl_certificate      /root/https/localhost.crt;
       ssl_certificate_key  /root/https/localhost.key;

    #    ssl_session_cache    shared:SSL:1m;
    #    ssl_session_timeout  5m;

    #    ssl_ciphers  HIGH:!aNULL:!MD5;
    #    ssl_prefer_server_ciphers  on;

       location / {
           root   html;
           index  index.html index.htm;
       }
    }


## 附Python简单服务脚本

### Http

	python -m SimpleHTTPServer 8080
	
### Https

	import BaseHTTPServer, SimpleHTTPServer
	import ssl
	
	httpd = BaseHTTPServer.HTTPServer(('localhost', 443), SimpleHTTPServer.SimpleHTTPRequestHandler)
	httpd.socket = ssl.wrap_socket (httpd.socket, keyfile='./localhost.key' certfile='./localhost.pem', server_side=True)
	httpd.serve_forever()
	
	# 使用openssl测试
	openssl s_server -accept 443 -key localhost.key -cert localhost.crt -CAfile ca.crt
	openssl s_client -connect 192.168.3.117:443 -key user.crt -key user.key -CAfile ca.crt