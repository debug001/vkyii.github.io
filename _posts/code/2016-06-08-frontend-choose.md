---
layout: post
title: Web前端技术选型
category: 备忘
tags: [Web, React]
keywords: 
description: 
---

## 背景
可能要调到新的部门,但是技术人员加上我才两个人,稍作探讨之后,发现几个问题

## 后端
由于目前所有的技术开发都是之前同一个人,从Web到后台到数据库,不得不说是件不容易的事情.

后端用的是Asp.net Web Forms,在折腾了一天Asp.net Core 1.0.0 rc2之后,发现这货已经被drop掉了,虽然.Net4.x仍然在支持.

对于我这样对新技术比较感兴趣而且没有VS开发条件的人来说,显然不再合适.

而且有一个明显的耦合在里面,页面是在aspx中渲染的,比如:

```html
<ul>
	{%li_list}
</ul>
```

对于前端的写手来说,*li_list*会是什么就完全不知道了,这显然不是件开心的事情.


## 前端
回过头来,又翻出[Angular][1]和[React][2]作了一番比较,其实开始对[Angular][1]是更有兴趣的,尤其是双向数据绑定配合*$http*动态获取数据进行渲染,几乎完美地解决了前面所说耦合的问题.

作为代价,[Angular][1]有更陡的学习曲线,而且需要适应它的规则,比如for循环等,当然,最为关键的是其动态渲染导致SEO的问题.

采用[React][2],其实应该把node渲染组件的部分归为前端,那么后端仍然只需要专注于业务.并且在做移动端的App时,很有可能[React Native][3]也能派上用场.


[1]: https://angular.io/
[2]: https://facebook.github.io/react/