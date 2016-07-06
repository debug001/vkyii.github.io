---
layout: post
title: IIS下自动git部署
category: 备忘
tags: [IIS, git]
keywords: 
description: 
---


# 引

代码服务器使用IIS+[bonobogitserver](https://bonobogitserver.com/)

今天的需求是提交代码后,自动部署Web,能在外网直接访问.

当然,IIS本身已经外网可以访问


# 步骤

* 进入*[BonoboGitServerDir]/Response/repo.dir/hooks*

* 建立文件*post.receive*,内容如下:

```shell
#!/bin/sh
LOGFILE=./post-receive.log
DEPLOYDIR=/c/inetpub/wwwroot/repo.deploy/
echo -e "[log] Received push request at $( date +%F)" >> $LOGFILE
echo "[log] Starting Deploy..." >> $LOGFILE
GIT_WORK_TREE="$DEPLOYDIR" git checkout -f
echo "[log] Finished Deploy" >> $LOGFILE
```

* 当master分支提交后,自动部署到repo.deploy

# 参考
[One command deployments to IIS using Git](https://dylanwooters.wordpress.com/2015/02/21/one-command-deployments-to-iis-using-git/)