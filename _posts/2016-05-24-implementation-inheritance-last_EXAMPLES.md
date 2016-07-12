---
title: Implementation Inheritance Last
author: Iván Stepaniuk
layout: post
permalink: /implementation-inheritance-last/
categories: design, ruby
---

### TL;DR:
When designing, consider class composition and delegation BEFORE extending or designing classes for extension. Extension is less reusable and less maintainable. Don't be very "clever".

### A bit longer:
Implementation inheritance is often not the best pattern to reuse code or make code reusable.

Implementation inheritance breaks encapsulation and forces us to peek at the parent implementation to be able to inherit from it safely, the interface of the base class is not a safe contract to extend on.

Inheritance is the tightest form of code coupling. It is especially dangerous in Ruby when mixed with concerns out of sight, mixins, and the fact that Ruby does not have a 'final' or 'sealed' mechanism to prevent unsafe inheritance.

More often than not, it is better to compose or delegate rather to extend, especially when there is no clear and orthodox inheritance pattern (template method, strategy, etc.) It is often impossible to get inheritance right when adding features to existing code that does not follow OCP, not to mention trying to reuse these bits afterwards! Impossible.

Composition is normally accomplished by DI through the constructor in the object that needs the behavior. DI in the Ruby world is kind of a controversial thing, mainly because of people misread and missquote @dhh. That aside, let's just refrain from further designing "clever" inheritance-first designs. Even hardcoding dependencies in a service is a better way! (but you better not http://goo.gl/tLMGGb)


# A. Less of this! Inheritance first, include
class BreakfastWithToastsService < BaseBreakfast

  include Toastable

  def prepare
    start_toaster
    # fingers crossed...
    super
  end
end


# B. More of this: Composition, DI
class BreakfastWithToastsService

  def initialize(toaster)
    @toaster = toaster
  end

  def prepare
    @toaster.start!
    # ... more stateless orchestration
  end
end

Why?

    The contract between the service and the toasting behavior is smaller and more clear in B.
    In A, BreakfastWithToastsService and BaseBreakfast are tightly coupled.
    BaseBreakfast should not touch the bread, or this will break.
    In B, Breakfast knows very little about Toaster, and Toaster knows nothing at all.
    In A, Toastable code can actually depend on Breakfast stuff, even state, which is horrible.
    We can safely test B injecting a stub Toaster, but to test A, we need to modify the SUT instance.
    The test for B will therefore be more likely to break, as it is coupled to the implementation details (how it does it), instead of just to the behavior we want to test (what it does).
    Additionally, Toastable is not encapsulated but a bunch of methods, probably not reusable for a Lunch anyway.
