+++
categories = ["software development"]
tags = ["tdd", "automation", "bug", "clean code"]
date = "2019-02-27"
title = "Should We Write Tests?"
type = "article"
+++

One day, my friend wrote this in his timeline

{{< figure src="/img/test.jpg" title="I guess he's tired for writing tests" >}}

I know writing tests --both UT or integration tests-- is boring and sometimes troublesome. But I will show you why you should write tests on most occasions (besides knowing your code is working, of course)

**1. Eliminate regression**

By writing tests, we make sure for everybody else working on this code to not break existing flow. In case any flow disturbed, bug can be prevented and also debugging become less costly.

**2. Force us to [eating our own dog food](https://en.wikipedia.org/wiki/Eating_your_own_dog_food)**

Writing test also means trying to use service made by ourself. This way, we can be sure our service is simple and clean enough for anybody willing to use.

**3. Provide clear contract**

Tests also can be used as a behavior contract. We could recognize what the expected output provide by a component by examine the running test.

Those are just a few examples and still a lot more reasons why we should consider to write tests for every change we introduce. Not to mention to safeguard the deployment and so on.
