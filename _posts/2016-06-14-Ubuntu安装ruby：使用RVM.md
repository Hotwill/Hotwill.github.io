---
layout: post
title: Ubuntu安装ruby：使用RVM
category: Linux
tags: [Ruby, RVM]
keywords: Ruby,RVM,安装,多版本
description: 
---

直接在Ubuntu的软件源中安装ruby，只能安装1.9.1的，无法安装最新版。有些软件依赖于Ruby 2，而有些软件依赖于Ruby旧的版本。使用rvm可以很好地解决这个问题。RVM 是一个命令行工具，可以提供一个便捷的多版本 Ruby 环境的安装、管理和切换。

## RVM的安装
	$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	$ \curl -sSL https://get.rvm.io | bash -s stable
	$ source ~/.bashrc
	$ source ~/.bash_profile

修改 RVM 的 Ruby 安装源到 Ruby China 的 Ruby 镜像服务器，这样能提高安装速度:

	$ echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db

## Ruby 的安装与切换
**列出可以安装的Ruby版本**

	$ rvm list known

**安装某个版本的Ruby**

	$ rvm install 2.3.0

这里安装了最新的 2.3.0, rvm list known 列表里面的都可以拿来安装。

**切换Ruby版本**

	$ rvm use 2.3.0

将Ruby版本切换到2.3.0
**设置默认的Ruby版本**

	$ rvm use 2.3.0 --default

这样系统中的Ruby版本就被设置为了2.3.0

更详细的教程可以参考ruby-china的这篇教程：[https://ruby-china.org/wiki/rvm-guide](https://ruby-china.org/wiki/rvm-guide)

