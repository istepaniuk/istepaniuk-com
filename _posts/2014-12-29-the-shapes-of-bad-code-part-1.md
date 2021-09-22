---
title: The Shapes of Bad Code, Part 1
author: Iván Stepaniuk
layout: post
permalink: /the-shapes-of-bad-code-part-1/
tags:
  - quality
---

I have noticed that when looking at some not-so-awesome piece of code for the first time, I can tell many things about it even before putting my glasses on, and while scrolling at a speed at which it is actually impossible to read anything at all.

> #### &ndash; _"Oh my god, look at this code!"_

### The Shape of Bad Code

So what is that I see? The only thing you can see while scrolling that fast and squinting is shapes, the shapes formed by different blocks of text filling the screen, plus the colors of your syntax highlighting.

 So I decided to make some screenshots of my text editor to illustrate some of these bad code shapes, and I will write a post for two of these at a time. I also distorted the images to make sure we are not actually reading this code.

#### Code Duplication

![Code duplication](/img/shape-duplication.png)

This is probably the best example so it goes first. This is JavaScript, but that is completely irrelevant in this case. This image shows two near-identical functions, both fit the screen and what's going on is quite obvious. Sometimes a few scroll up & down movements are required to reveal a block of code that has been mercilessly copy-pasted, even more than once. I will not tell you why having duplicated code is bad, you probably learned that the first time you write a program with more than 30 lines.

This duplication was probably introduced because it would have taken 120 more seconds to understand the original functionality and modify the existing code accordingly. Of course, it will now take 10 minutes to revert the damage, or even more if the different copies started to diverge.

#### Too Many Dependencies

![Too may dependencies](/img/shape-imports.png)

This is Python code, but the same shape is valid for any other language that requires you to declare the dependencies before using them, and that would be most of them.

We do not know what is that this piece of code does, but there is something I can be sure of; There is practically no way that a this file/module/class is doing **only one thing.**

If it needs this all these `import` statements, the [single responsibility principle](https://en.wikipedia.org/wiki/Single_responsibility_principle) is clearly not being observed. If the file/module had many smaller classes with different dependencies each, it's also time to split this file into smaller ones, as almost every reason to observe SRP in classes and methods also applies for entities at the file (or module, package, assembly, etc.) level.

#### More ugly code shapes!
Check out [Part 2](/the-shapes-of-bad-code-part-2/), and also [Part 3](/the-shapes-of-bad-code-part-3/)
