---
title: Extract Test Fixtures Early
author: Iván Stepaniuk
layout: post
permalink: /extract-test-fixtures-early/
categories:
  - Testing
  - TDD
---

### TL;DR:
When writing unit tests, extract test fixtures early on.

### A bit longer:
We often delay some types of refactoring with good reason. During a TDD session, 
an _extract class_, or even _extract method_ done too early might limit your 
refactoring chances later, so we sometimes let refactors "ripe".

However, the construction of the objects involved in unit tests is better elsewhere and
not on the tests themselves, as soon as possible.

The reason is that there is no amount of automatic refactoring that will let you easily change 
the signature of your _Value Objects_ if they are repeated over and over in every related unit
test. 

So instead of doing:
```java
@Test
public void it_publishes_an_ugraded_event_when_a_regular_tenant_switches_to_premium() {
    var premiumPlan = new Plan('example premium plan', PlanType.PREMIUM);

    tenant.switchToPlan(premiumPlan);

    verify(mockEventPublisher, only()).publish(any(AccountPlanUpgraded.class));
}

@Test
public void it_publishes_a_downgraded_event_when_a_regular_tenant_switches_to_a_free_plan() {
    var freePlan = new Plan('example free plan', PlanType.FREE);

    tenant.switchToPlan(freePlan);

    verify(mockEventPublisher, only()).publish(any(AccountPlanDowngraded.class));
}

// and many more ... 
```

Try to introduce fixtures early on: 

```java
@Test
public void it_publishes_an_ugraded_event_when_a_regular_tenant_switches_to_premium() {
    var premiumPlan = Fixtures.givenAPremiumPlan();

    tenant.switchToPlan(premiumPlan);

    verify(mockEventPublisher, only()).publish(any(AccountPlanUpgraded.class));
}

@Test
public void it_publishes_a_downgraded_event_when_a_regular_tenant_switches_to_a_free_plan() {
    var freePlan = Fixtures.givenAFreePlan();

    tenant.switchToPlan(freePlan);

    verify(mockEventPublisher, only()).publish(any(AccountPlanDowngraded.class));
}

// and many more ... 
```

