---
title: Castle Dynamic Proxy and moq
author: Iván Stepaniuk
layout: post
permalink: /castle-dynamic-proxy-and-moq/
categories:
  - Testing
tags:
  - castle
  - dynamic proxy
  - moq
---
At SaludOnNet we are using <a href="http://code.google.com/p/moq/" target="_blank">Moq</a> as our mocking framework for doing TDD on C#. I am very happy with Moq, it&#8217;s very simple yet powerful and flexible. It lacks the complexity of <a href="http://hibernatingrhinos.com/open-source/rhino-mocks" target="_blank">RhinoMocks</a> (and some of it&#8217;s features) but the learning curve is very smooth, and the API almost explains itself. We love it.

We recently, started using <a href="http://stw.castleproject.org/Default.aspx?Page=DynamicProxy&NS=Tools" target="_blank">Castle Dynamic Proxy</a> to add interception capability to our controller-service layer boundary, we mainly use it to decorate the service methods with authorization, cache directives, etc. quite handy.

## The problem

Moq also uses Castle Dynamic Proxy to implement the mock classes. Mock objects are actually instances of proxy classes using Castle.

When creating proxies of the services in the production code, our controller unit tests went nuts because the service classes where already proxied by moq beforehand. As a side effect, the unit tests started actually executing the original implementations of the mocked classes!

## The solution

The best one we have found so far is to alter our production code so it checks for a moq mock instance using reflection. In that case it skips the proxy creation altogether and just adds our interceptors to the existing proxy. This has a performance penalty, but it is testable and it put us back on track right away. I will update this post and include some code snippet if we come up with something cleaner.