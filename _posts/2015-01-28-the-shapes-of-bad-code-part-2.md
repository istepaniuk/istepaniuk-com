---
title: The Shapes of Bad Code, Part 2
author: Iván Stepaniuk
layout: post
permalink: /the-shapes-of-bad-code-part-2/
tags:
  - quality
---

I have noticed that when looking at some not-so-awesome piece of code for the first time, I can tell many things about it even before putting my glasses on, and while scrolling at a speed at which it is actually impossible to read anything at all.

This is Part 2, check out [Part 1](/the-shapes-of-bad-code-part-1/)!

### The Shape of Bad Code, Part 2

#### Abuse of vertical spaces

![Vertical space abuse](/img/shape-vertical-space.png)

The single-responsibility principle applies at many levels, and it definitely does at a method level. When a method does more than one thing but has not been split in separated methods, it is common to see vertical spaces separating this different functions. If you need to add vertical space to understand the body of a method, wouldn't it be better to extract that second section as a separated method and give it a **good name**?

#### Comment-delimited sections

![Section comments](/img/shape-vertical-comments.png)

This is a somewhat improved version of the previous shape. Each section is separated by vertical space, but comments have been added at the start of each section to try to make the reader's life easier.

Again, more often than not, this sections can be extracted into several methods, and those comments can be transformed into the names of the extracted methods. If there where many sections to extract, it is also probable that these methods actually belong to a **new class**!


#### Stay tuned for the last ugly code shapes!
