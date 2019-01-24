---
layout: post
title: 搭建X11 Server，让Linux服务器运行GUI程序
category: Linux
tags: X11 GUI
keywords: X11
description: 搭建X11 Server，让Linux服务器运行GUI程序
---



前言
--------------

Linux服务器一般是没有安装GUI组件的，一般都是命令行界面。要想在Linux服务器上运行图形界面，一种方法是在服务器上安装GUI组件，然后远程登陆。但安装GUI组件可能引起服务器不稳定，而且服务器不一定能访问外网，安装GUI组件可能会很麻烦。

其实利用X Windows，不需要在Linux服务器上安装任何软件，就能在Linux服务器上运行GUI程序。

X Windows介绍
--------------
X Window 系统最初是由 MIT 在 1984 年开发的，目的是为了给 Unix 以及类 Unix 操作系统一个通用性强且硬件无关的 GUI 接口。目前常见的 X Window 系统都是基于 11 版本进行改良的，所以统称为 X11。X11 使用了 C/S 架构，大致的工作原理如下图：

![x-windows](/assets/img/x-windows.jpg)

由于使用了C/S结构，GUI程序和显示的界面可以在不同的机器上。Linux服务器作为X Windows的客户端，将程序的界面数据发送到X Windows服务器，在X Windows服务器上显示界面。X Windows服务器可以运行在有界面的windows、Linux或者mac上。

安装步骤
--------------------
1. 在mac上安装X Windows服务器XQuartz。Windows和Linux上也有对应的软件，Google即可。
2. 启动XQuartz，并在终端中运行`sudo xhost +`。这条命令是允许所有客户端连接到改服务器，如果不执行，在Linux服务器那边报`No protocol specified`的错误。
3. 在Linux服务器上定义一个环境变量：`export DISPLAY=ip:0.0`。ip为mac的ip地址，后面的0.0是X Windows服务器监听端口相对于6000的偏移量。如果X Windows服务器的监听端口是6000（默认），则为0.0；如果监听端口是6005，则为5.0
4. 安装一个GUI小工具，如xclock，运行试试效果

