+++
Categories = ["testing", "automation"]
Tags = ["burp", "intercept", "java", "testing", "automation"]
date = "2017-08-22"
title = "How Using Burp Can Simplify Debugging Third Party Request"
+++

Few week ago, I made an automatic delivery status checker. This job will run every day checking whether order with certain tracking codes had arrived or not. The system I was working on built using [Play Framework](https://playframework.com) and it was rather complicated so that I didn't know to which class I had to put some loggers. On top of that, there were some problems occured while trying to get plain HTTP request and response. And that's why I decided to use Burp to debug requests I made to shipping services API.

Burp Suite is a tool suite for web security testing. It consists of multiple components, like spider, proxy, repeater, scanner, etc. In this case, only proxy and repeater component would be used. By using these two, the requests made could be intercepted, logged, modified, and then fired again. 

First, ensure your proxy is on and redirect all your apps request through it.

![alt text](https://portswigger.net/sc/MobileSetUp_1.png)

If it configured correctly, all requests will appear in the log table.

![alt text](https://matttheripperblog.files.wordpress.com/2015/12/http-history.png?w=540)

We can, sort the request by status and found out which requests are errors.