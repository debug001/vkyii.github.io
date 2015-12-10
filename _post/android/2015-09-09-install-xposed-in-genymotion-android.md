---
layout: post
title: 在Android5.1(Genymotion)下安装xposed
category: 安卓
tags: Xposed
keywords: 
description: 
lastupdate: 2015-09-11
---

# 环境
* MacOS
* Genymotion
* Android5.1.0-api22

# 过程
* [下载安装包][1],一个installer,一个SDK,注意选择正确的版本
* 安装[GenyFlash][2],按这里所说,Genymotion在拖放flashing ZIP时,只是简单地复制文件到system目录下.GenyFlash做了一些权限提升的工作.经过多次尝试,同样的安装Xposed过程,有GenyFlash确实会成功.
* Genymotion支持拖放安装,先装installer,再装SDK,完了之后\_软启动\_(Xposed-\>Framework),基本就OK了

# Sample
* 建立一个Android工程
* `/assets/xposed_init`文件指定了module的入口类,注意是`assets`不是`asserts`(踩这种坑也是醉了),如:

		com.vkyii.helloxposed.HookHello

* AndroidMannifest.xml内容:

		<manifest xmlns:android="http://schemas.android.com/apk/res/android"
		    package="com.vkyii.helloxposed">
		
		    <application android:allowBackup="true" android:label="@string/app_name"
		        android:icon="@mipmap/ic_launcher" android:theme="@style/AppTheme">
		        <meta-data
		            android:name="xposedmodule"
		            android:value="true"/>
		        <meta-data
		            android:name="xposeddescription"
		            android:value="Xposed模块示例"/>
		        <meta-data
		            android:name="xposedminversion"
		            android:value="73"/><!-- 对应的XposedBridge版本号 -->
		    </application>
		
		</manifest>

* 依赖XposedBridge.jar于`build.gradle`

		    provided files('libs/XposedBridgeApi-20150213.jar')

* 简单的hook代码:

		package com.vkyii.helloxposed;
		
		
		import de.robv.android.xposed.IXposedHookLoadPackage;
		import de.robv.android.xposed.XposedBridge;
		import de.robv.android.xposed.callbacks.XC_LoadPackage;
		
		/**
		 * Created by linbo on 15/9/10.
		 */
		public class HookHello implements IXposedHookLoadPackage {
		    @Override
		    public void handleLoadPackage(XC_LoadPackage.LoadPackageParam loadPackageParam) throws Throwable {
		        XposedBridge.log("handleLoadPackage");
		
		        //只hook测试app
		        if (loadPackageParam.packageName.equals("com.vkyii.hello")) {
		            XposedBridge.log("hit");
		        }
		    }
		}

* 安装完之后,在XposedInstaller的Module下应该可以看到模块了,勾选上,重启,日志输出正确的话就成功了

# 参考
* [Android hook框架入门][3]
* [Android.Hook框架Xposed篇][4]

[1]:	http://forum.xda-developers.com/showthread.php?t=3034811&page=2
[2]:	https://github.com/rovo89/GenyFlash
[3]:	http://my.oschina.net/wisedream/blog/471292
[4]:	http://www.droidsec.cn/android-hook%E6%A1%86%E6%9E%B6xposed%E7%AF%87/