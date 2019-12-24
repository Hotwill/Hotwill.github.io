---
layout: post
title: emby启用https
category: 技术
tags: [emby https]
keywords: emby https
description: 为emby server启用https支持
---

emby本身是支持https的，只需要提供一个包含了证书和私钥的 PKCS #12 文件，就可以在一个自定义域名上启动 TLS 支持。下面只需要申请一个自己域名的SSL证书即可。

## SSL证书申请

选择[freessl.cn](https://freessl.cn/)进行免费的证书申请，只需简单的几步就能申请一个证书。

### 1. 输入域名

![](/assets/img/SSL证书申请1.png)

### 2. 输入邮箱，CSR生成选浏览器生成

![](/assets/img/SSL证书申请2.png)

### 3. DNS验证

![](/assets/img/SSL证书申请3.png)

这一步就是要验证填写的域名是属于你的。可以选择DNS验证，在域名下添加要验证的记录即可。添加好之后等个几分钟，DNS生效之后点击验证。如果验证通过，浏览器会自动下载证书，是一个压缩包，包含两个文件，一个pem文件，一个私钥文件。

### 4. 转化证书格式

由于emby需要的是PKCS12格式的证书，我们刚刚生成的是PEM格式的，需要转化出PKCS12格式的证书。很多工具提供这种转换，为方便，选择一个在线的转换网站，https://www.sslshopper.com/ssl-converter.html。把PEM文件和私钥上传，就可以生成扩展为pfx的PKCS12格式的证书。把这个证书放在服务器上，在emby中设置一下并重启emby服务即可。

## 最终效果

![](/assets/img/SSL证书申请4.png)

