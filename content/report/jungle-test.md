+++
categories = ["software architecture", "testing"]
tags = ["testing", "", "clean architecture", "oop"]
date = "2019-01-10"
title = "Testing Entire Jungle"
type = "article"
+++

> You wanted a banana but what you got was a gorilla holding the banana and the entire jungle

In order to create a modular classes, a lot people compose several layers of abstractions. One of the most populous usage is [onion architecture](http://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) (also called hexagonal architecture). One of the promise is to make classes more testable. I'd say not quiet the case.

Consider following example, we want to test internal method `ChangePaymentStatus` inside `PaymentService` class. This method cannot be called publicly. So, in order to do that, we need to call `VerifyAndUpdatePaymentStatus`, and then mock both `PaymentProviderService` and `OrderService` for verification. For each services, we have to mock several another methods again. It turns out we called the entire jungle whereas we just wanna taste a banana.

This problem arise when someone do clean architecture without considering proper concern separation, in this case [interface segregation principle](https://medium.com/@severinperez/avoiding-interface-pollution-with-the-interface-segregation-principle-5d3859c21013). Each service, should be designed to extend several API contract. And then, we would not want to test the service itself, but the contracts. Each contract will focus only part of specific cases a service should have.

In the case above, `PaymentService` should extend `UpdatePaymentStatus` and `VerifyPaymentStatus`, then introduce verification as different mocked object. This way, we don't even need  `PaymentProviderService` and `OrderService` anymore. As we expect to get banana we just need banana tree itself. Not the gorilla or the jungle.