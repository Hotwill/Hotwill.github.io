---
layout: post
title: dnscrypt-proxy+dnsmasq搭建无污染DNS服务器
category: Linux
tags: DNS服务器
---

# 为什么要搭建自己的DNS服务器？

国内的DNS已经被严重污染了，很多的域名返回的都是错误的域名。要防止DNS的污染，就需要用一种加密的DNS协议。DNSCrypt 协议就能满足这种要求，DNSCrypt 是一种加密的DNS协议，有很多的DNS服务器都支持这种协议，支持 DNSCrypt 协议的服务器列表在[这里](https://github.com/jedisct1/dnscrypt-proxy/blob/master/dnscrypt-resolvers.csv)。

# 方案

最好的方案是国内的域名通过国内的DNS服务器（比如114或阿里DNS）查询，国外的通过 DNSCrypt 查询，这就需要dnsmasq的配合。dnsmasq是一个开源的，小巧的DNS服务器，支持很多的配置选项，最大的优点是能通过配置文件指定不同的域名通过不同的DNS服务器来查询。已经有人把这样的配置文件做好了，放在Github上了，叫做[dnsmasq-china-list](https://github.com/felixonmars/dnsmasq-china-list)，这是一个国内域名列表。

# 安装和配置

安装和配置参考[这篇文章](https://github.com/wongsyrone/LinuxNotes/blob/master/05.md)。
文章中讲的是编译安装的方式，也可以直接在软件源中安装（软件源中不一定有）。
安装dnscrypt-proxy之前必须安装libsodium，centos中，在安装libsodium之后要执行下面这两行命令，不然configure时会有错误：

```bash
# echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf
# ldconfig
```
dnscrypt-proxy 通过添加启动参数来配置的方式比较简单，可以通过下面这条命令来启动 dnscrypt-proxy 服务：

```bash
# dnscrypt-proxy --resolver-name=4armed --local-address=127.0.0.1:35535
```

主要需要指定解析服务器和端口，4armed是[解析服务器列表](https://github.com/jedisct1/dnscrypt-proxy/blob/master/dnscrypt-resolvers.csv)中的第一个，速度还可以，自己找一个速度比较快的就可以。默认的端口是53，53必须留给dnsmasq用，所以必须换另外一个端口。

dnscrypt-proxy 服务启动之后，用dig命令查询 youtube.com 的 ip 测试一下：

```bash
$ dig @127.0.0.1 -p 35535 youtube.com
; <<>> DiG 9.9.4-RedHat-9.9.4-18.el7 <<>> @127.0.0.1 youtube.com
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 53341
;; flags: qr rd ra ad; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;youtube.com.                   IN      A

;; ANSWER SECTION:
youtube.com.            1       IN      A       74.125.68.136
youtube.com.            1       IN      A       74.125.68.91
youtube.com.            1       IN      A       74.125.68.190
youtube.com.            1       IN      A       74.125.68.93

;; Query time: 0 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
;; WHEN: Sun May 22 21:13:25 CST 2016
;; MSG SIZE  rcvd: 93
```

应该就能查询到正确的 ip 地址。

## 然后配置 dnsmasq

dnsmasq 的配置文件在 /etc/dnsmasq.conf 中，在配置文件中写入：

```bash
# 配置文件的目录，dnsmasq-china-list的配置文件就放在这个目录中，会陪自动加载
conf-dir=/etc/dnsmasq.d
#禁用resolv配置文件
no-resolv
no-poll
#resolv server 使用本机的dnscrypt-proxy
server=127.0.0.1#35535
#cache 大小，默认为150
cache-size=1500
```

然后将[dnsmasq-china-list项目](https://github.com/felixonmars/dnsmasq-china-list)中的三个 .conf 配置文件放到 /etc/dnsmasq.d 目录下。

**这样，一个无污染，快速的DNS服务器就搭建好了！**
