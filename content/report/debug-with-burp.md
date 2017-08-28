+++
Categories = ["testing", "automation"]
Tags = ["burp", "intercept", "java", "testing", "automation"]
date = "2017-08-26"
title = "Debugging External Request Error Easier with Burp"
+++

In the development process, normally every functionality should be tested as fast as possible. After passing unit test, we need to ensure it pass integration testing ---and then live testing if possible. But some cases, like scheduled jobs can't run without database connection and of course, cron process. Which means we can run testing without live system. 

Another option is to save all request from one job run. Every failed request can be repeated again after doing some debugging. One of tools to help you achieve that is Burp.

**So what is Burp Suite**

Shortly, Burp (Suite) is an all-in-one toolset for testing web apps security. It consists of several  One of the promising module is proxy tool. Burp can act as a web proxy, log all pass-through web traffic, and even intercept to make alteration to the packet.

![alt text](http://www.e-spincorp.com/espinv3/images/burp_proxy.png)

**Interesting, now**

