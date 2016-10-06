---
layout: post
title: windows远程连接ubuntu 16.04的unity桌面
category: Linux
tags: ubuntu
keywords: [远程连接]
description: windows远程连接ubuntu的方法
---

之前一直想在windows下远程连接ubuntu的unity桌面，一直没有成功，今天按照搜索到[这篇博客](http://c-nergy.be/blog/?p=9962)，成功了。效果还不错，先贴一张图。

![windows远程连接到ubuntu](/assets/img/远程连接ubuntu.png)

## 下载并安装TigerVNC

在ubuntu 16.04下需要手动下载和安装TigerVNC。[这里](http://www.c-nergy.be/downloads/tigervncserver_1.6.80-4_amd64.zip)有一个编译好的deb安装包，适用于64位的ubuntu 16.04.1。

    wget http://www.c-nergy.be/downloads/tigervncserver_1.6.80-4_amd64.zip

下载好之后解压得到tigervncserver_1.6.80-4_amd64.deb  
然后安装：

    sudo dpkg -i tigervncserver_1.6.80-4_amd64.deb

会有错误信息出现，忽略。执行

    sudo apt-get install -f

强制安装依赖包。这样TigerVNC就安装成功了。

## 安装xrdp

    sudo apt-get install xrdp -y

在用户目录下新建文件 .xsession

    vi ~/.xsession

写入下面的配置信息：

    /usr/lib/gnome-session/gnome-session-binary --session=ubuntu &
    /usr/lib/x86_64-linux-gnu/unity/unity-panel-service &
    /usr/lib/unity-settings-daemon/unity-settings-daemon &

    for indicator in /usr/lib/x86_64-linux-gnu/indicator-*; 
    do
        basename=`basename ${indicator}`
        dirname=`dirname ${indicator}`
        service=${dirname}/${basename}/${basename}-service
        ${service} &
    done

    unity

其实只需要最后的一行unity也是可以的，上面的那么多行是为了解决没有右上角的任务条的问题。

按照上面的步骤就配置好了。然后可以使用windows自带的远程桌面来连接了。