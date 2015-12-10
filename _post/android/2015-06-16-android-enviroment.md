---
layout: post
title: Android相关的环境变量
category: 安卓
tags: VisualGDB
keywords: 
description: 
---

# 安装或解压JDK/AndroidSDK/NDK后
* JAVA\_HOME
	* //指向jdk目录
* ANDROID\_SDK
	* //指向AndroidSDK目录,某些IDE可能会强制要求变量名
* ANDROID\_NDK
	* //指向AndroidNDK目录,某些IDE可能会强制要求变量名
* ClassPath
	* .
	* %JAVA\_HOME%\\lib\\tools.jar
	* %JAVA\_HOME%\\lib\\dt.jar
	* %JAVA\_HOME%\\lib
* Path
	* %JAVA\_HOME%\\bin
	* %ANDROID\_SDK%\\tools
	* %ANDROID\_SDK%\\platform-tools
	* %ANDROID\_NDK%
	* %Path%

# VisualGDB相关
VisualGDB还使用Ant让我有点不爽,特别是出现这些莫名的编译错误的时候:
像这样的:
> Execute failed: java.io.IOException: Cannot run program "C:\vkyii\Code\AndroidProject1\${aapt}”” CreateProcess error=2, ?????????

在反复确认环境变量没问题之后,最后只能认为build.xml里的\_${aapt}\_没有定义了,于是手动加上缺少的这几个工具:(build.xml154行左右)

	    <!-- tools location -->
	    <property name="android.tools.dir" location="${sdk.dir}/tools" />
	    <property name="android.platform.tools.dir" location="${sdk.dir}/platform-tools" />
	    <property name="android.build.tools.dir" location="${sdk.dir}/build-tools/19.1.0" />
	    <condition property="exe" value=".exe" else=""><os family="windows" /></condition>
	    <condition property="bat" value=".bat" else=""><os family="windows" /></condition>
	    <property name="adb" location="${android.platform.tools.dir}/adb${exe}" />
	    <property name="lint" location="${android.tools.dir}/lint${bat}" />
	    <property name="aapt" location="${android.build.tools.dir}/aapt${exe}" />
	    <property name="dx" location="${android.build.tools.dir}/dx${bat}" />
	    <property name="zipalign" location="${android.build.tools.dir}/zipalign${exe}" />