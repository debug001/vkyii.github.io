---
title: Sublime Text3 OmniMarkupPreviewer 的一个小改装
layout: post
date: 2016-04-12 00:12:14
catagory: 备忘
tags: Sublime
description:
---


## 问题
写Markdown文档时用OmniMarkupPreviewer做实时预览是很爽的事情,目前的情况是:

博客是用Jekyll的,在索引图片等资源时是以jekyll项目根目录为工作目录,而实时预览时是以当前文档目录为工作目录的.

简单点说,用`/assets/xxx.png`是博客里的正确用法,用`../assets/xxx.png`才能正确实时预览


## 解决方案
Markdown文件里所有的资源路径写为`{{site.img_url}}/xxx.png`.

编辑`RendererManager.py` -> `class RendererManager` -> `def render_text_postprocess` -> `def encode_image_path`

```python
# 在url = m.group(2)后面加入
url = re.sub(r'{{\s*site.img_url\s*}}', '../../assets/img', url)
```

如此,配置在`_config.yml`中配置`img_url`:

* 当`site.img_url=''`时,使用本地的图片资源
* 当`site.img_url='http://image.bed/'`时,使用图床的图片资源
* 当然,使用OmniMarkupPreviewer时,也可以正确索引本地的图片资源了

