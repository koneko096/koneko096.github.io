+++
Categories = ["software engineering", "testing"]
Tags = ["burp", "intercept", "proxy", "testing"]
date = "2017-08-26"
draft = true
title = "Debugging External Request Error Easier with Burp"
+++

In the development process, normally every functionality should be tested as fast as possible. We would like to run unit test if possible. If not enough, then integration test. And finally, live testing at very last before deployment and if all other testing cannot performed. But, of course, the bigger testing scope, it would take a lot of resource and time to test.

For example, we want to test whether certain object spawned when a method is called. We can make a unit test that create a mock object, call method with mocked parameter, then verify whether certain method is called inside ---like using [PowerMockito](https://raseshmori.wordpress.com/2015/01/07/mockito-and-power-mockito-cheatsheet/) or something similiar without calling any other unnecesary classes. But, how if for example, we want to test whether request to certain API 

 is to save all request from one job run. Every failed request can be repeated again after doing some debugging. One of tools to help you achieve that is Burp.

**So what is Burp Suite?**

Briefly, [Burp (Suite)](https://portswigger.net/burp) is an all-in-one toolset for testing web apps security. It consists of several tools like Proxy, Sniper, Intruder, and Repeater. One of the promising module is proxy tool. Burp can act as a web proxy, log all pass-through web traffic, and even intercept to make alteration to the packet.

{{< figure src="http://www.e-spincorp.com/espinv3/images/burp_proxy.png" title="Kansei Drifto" >}}

**Interesting, now what can this thing do?**

{{< figure src="https://s2.postimg.org/sd7lj84mx/Screenshot_59.png" title="Kansei Drifto" >}}

{{< figure src="https://s2.postimg.org/ytgk9bd6h/Screenshot_61.png" title="Kansei Drifto" >}}