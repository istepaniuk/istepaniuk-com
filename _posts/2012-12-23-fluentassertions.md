---
title: FluentAssertions
author: Iván Stepaniuk
layout: post
permalink: /fluentassertions/
categories:
  - .net
  - Testing
tags:
  - 'C#'
  - Fluent
  - FluentAssertions
  - Unit Testing
---
<a href="http://fluentassertions.codeplex.com/" target="_blank">FluentAssertions</a> is a set of .NET extension methods that allow you to more naturally specify the expected outcome of a TDD or BDD-style test. It is written by <a href="http://www.dennisdoomen.net/" target="_blank">Dennis Doomen</a> and <a href="https://twitter.com/mpopdam" target="_blank">Martin Opdam</a>. For a quick overview, take a look at the <a href="http://fluentassertions.codeplex.com/documentation" target="_blank">documentation</a>.

## Fluent!

FluentAssertions allows us to convert something like this:

```csharp
[Test]
public void ReturnsYellowForBananas()
{
    var service = new FruitColorService();
    var result = service.GetColorOf(new Banana());
    Assert.AreEqual(Color.Yellow, result);
}
```

Into something like this:

```csharp
[Test]
public void ReturnsYellowForBananas()
{
    var service = new FruitColorService();

    var result = service.GetColorOf(new Banana());

    result.Should().Be(Color.Yellow);
}
```

## Exception checking

It also allows for this kind of exception checking (here using the *Microsoft.Visual.Studio. UnitTesting* namespace instead of NUnit like in the previous examples):

```csharp
[TestMethod()]
[ExpectedException(typeof(InvalidFruitException))]
public void ThrowsAnExceptionIfItIsNotAFruit()
{
    var service = new FruitColorService();

    var result = service.GetColorOf(new Tomato());
}
```

To become the following snippet. I preffer this way because it keeps the *arrange, act, assert* form:

```csharp
[TestMethod()]
public void ThrowsAnExceptionIfItIsNotAFruit()
{
    var service = new FruitColorService();
    Action action = () => service.GetColorOf(new Tomato());
    action.ShouldThrow&lt;InvalidFruitException>();
}
```

I preffer the FluentAssertions way, but note that NUnit also has it&#8217;s fluent API for this purpose, using *Assert.That* in this case. the last two lines would become:

```csharp
TestDelegate test = () => service.GetColorOf(new Tomato());

Assert.That(test, Throws.Exception
      .TypeOf&lt;InvalidFruitException>());

```

## When something goes wrong

In contrast to the Microsoft *TestTools.Assert*, both FluentAssertions and NUnit try hard to make the error message as clear as possible, when a test fails you certainly want to know what is happening and not just that it broke plus a meaningless line number. This is true specially if you are not on the IDE where you can just click-and-go to the ofending test, but reading a report from your <a target="_blank" href="http://en.wikipedia.org/wiki/Continuous_integration">continuous integration</a> server. For the second test in this post, FluentAssertions would print out something like: 

```
Expected object to be Color [Yellow], but found Color [Green].
```

## Much more

FluentAssertions has lots of usseful methods to work with DateTime, TimeSpan, Collections, String, etc. It became an essential tool in my everyday work, if you are into C#, give it a try!
