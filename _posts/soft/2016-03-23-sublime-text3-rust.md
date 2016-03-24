---
title: Sublime Text3 下Rust环境搭建
layout: post
date: 2016-03-22 17:32:10
catagory: 备忘
tags: Sublime
description:
---

## 环境
* Mac
* Sublime Text3
* Rust

## 插件安装
* [TOML](https://packagecontrol.io/packages/TOML)
* [Rust](https://packagecontrol.io/packages/Rust)
* [RustAutoComplete](https://packagecontrol.io/packages/RustAutoComplete)
    * racer设置为racer程序
    * search_paths设置为Rust源码下的src目录
    * 像这样:

```json
        {
            // The full path to the racer binary. If racer is already
            // in your system path, then this default will be fine.
            "racer": "/Users/vkyii/.multirust/toolchains/stable/cargo/bin/racer",

            // A list of search paths. This should generally just
            // be the path to the rust compiler src/ directory.
            "search_paths": [
                "/Users/vkyii/Documents/Code/rust/src"
            ]
        }
```

* [SublimeLinter](http://www.sublimelinter.com/)
* [SublimeLinter-contrib-rustc](https://packagecontrol.io/packages/SublimeLinter-contrib-rustc)
* [RustCodeFormatter](https://packagecontrol.io/packages/RustCodeFormatter)
    * 先安装rustfmt: `cargo install rustfmt`
    * 默认快捷键: `ctrl+super+r`
    * 基本配置:

```json
        {
          "run_on_save": false,
          "show_errors": true,
          "rustfmt": "/Users/user/.cargo/bin/rustfmt"
        }
```
    

## 参考
[Are We IDE yet?](https://areweideyet.com/)


