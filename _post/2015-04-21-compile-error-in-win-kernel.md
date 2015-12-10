---
layout: post
title: 在内核中使用C++遇到的错误
category: 备忘
tags: 内核
keywords: 
description: 
---

---- 
## error LNK2019: 无法解析的外部符号 \_\_ultod3
参考[这里][1],结论是使用\_/arch:SSE\_或\_/arch:IA32\_

---- 
## error LNK2019: 无法解析的外部符号 \_\_wassert
自己实现,记得\_extern “C”\_:
extern "C" _CRTIMP void \_\_cdecl \_wassert(_In\_z\_ const wchar\_t \* _Message, \_In\_z\_ const wchar\_t \*_File, \_In\_ unsigned \_Line)
{
	DbgBreakPoint();
	DbgBreakPoint();
	return; 
}

---- 
## error C2193: “void \_\_cdecl dynamic atexit destructor for 'public: static std::\_System\_error\_category std::\_Error\_objects\<int\>::\_System\_object''(void)”: 已在段中C:\Program Files\Microsoft Visual Studio 12.0\VC\Include\xmemory0
这个问题一般出现在驱动程序中,把代码放在\_\#pragma code\_seg\_段中即可.

---- 
## error LNK2019: 无法解析的外部符号 "public: \_\_thiscall std::exception::exception
内核层无法使用std的异常体系,都注掉吧,[这里][2]有比较详细的说明

---- 
## error LNK2001: 无法解析的外部符号 “const type\_info::’vftable’”
项目属性 -\> C/C++语言 -\> 启用运行时类型信息 -\> (否)/GR

---- 
## error LNK2019: 无法解析的外部符号 \_\_ultod3
项目属性 -\> C/C++语言 -\> 代码生成 -\> 启用增强指令集 -\> 
* 流式处理 SIMD 扩展 (/arch:SSE)
* 或 无增强指令 (/arch:IA32)


[1]:	http://stackoverflow.com/questions/19556103/how-to-get-vs2013-to-stop-generating-calls-to-dtol3-dtoui3-and-other-funct
[2]:	http://www.codeproject.com/Articles/22801/Drivers-Exceptions-and-C