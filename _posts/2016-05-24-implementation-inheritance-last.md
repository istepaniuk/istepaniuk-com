---
title: Implementation Inheritance Last
author: Iván Stepaniuk
layout: post
permalink: /implementation-inheritance-last/
tags:
  - design
  - ruby
---

### TL;DR:
When designing, consider class composition and delegation BEFORE extending or designing classes for extension. Extension is less reusable and less maintainable. Don't be very "clever".

### A bit longer:
Implementation inheritance is often not the best pattern to reuse code or make code reusable.

Implementation inheritance breaks encapsulation and forces us to peek at the parent implementation to be able to inherit from it safely, the interface of the base class is not a safe contract to extend on.

Inheritance is the tightest form of code coupling. It is especially dangerous in Ruby when mixed with concerns out of sight, mixins, and the fact that Ruby does not have a 'final' or 'sealed' mechanism to prevent unsafe inheritance.

More often than not, it is better to compose or delegate rather to extend, especially when there is no clear and orthodox inheritance pattern (template method, strategy, etc.) It is often impossible to get inheritance right when adding features to existing code that does not follow OCP, not to mention trying to reuse these bits afterwards! Impossible.

Composition is normally accomplished by DI through the constructor in the object that needs the behavior. DI in the Ruby world is kind of a controversial thing, mainly because of people misread and missquote @dhh. That aside, let's just refrain from further designing "clever" inheritance-first designs. Even hardcoding dependencies in a service is a better way! (but you better not http://goo.gl/tLMGGb)

