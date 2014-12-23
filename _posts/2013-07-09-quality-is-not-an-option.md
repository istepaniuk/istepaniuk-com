---
title: Quality Is Not an Option
author: Iván Stepaniuk
layout: post
permalink: /quality-is-not-an-option/
lacandsnw_postmessage:
  - 
lacandsnw_twitterhandle:
  - 
categories:
  - .net
  - Agile
  - Testing
tags:
  - quality
  - testing
  - Unit Testing
---
I have recently participated in a meeting of <a href="https://twitter.com/MsCodersMadrid" target="_blank">@MsCodersMadrid</a>, a group of developers that work with Microsoft technologies. The proposed topic was &#8220;good coding practices&#8221;, and it was an open debate. People shared the tools they use for code style analysis in C#, such as StyleCop or ReSharper. We spoke about comments vs. no comments (NO!), regions vs. they are evil (EVIL!), etc., reaching similar conclusions.

&#8230;Then I mentioned unit testing, and things got a little bit hotter. We all agreed that unit tests are important, a good thing, and that **any decent software project must have tests.**

However, many people questioned the necessity of tests in some cases, and argued that they are optional, a luxury, or out of reach for some scenarios. This is no way specific to any member of this group of developers, and it is not the first time I hear these same arguments, so I will try to enumerate some these with my answers, no fingers pointed.

## &#8220;The customer does not want quality&#8221;:

<p style="padding-left: 30px;">
  <strong>If a customer admits they want crap, then you don&#8217;t want that customer.</strong> Let&#8217;s say that you run a high class restaurant; You cannot have a cheap &#8220;Microwave pizza&#8221; at the end of your menu as a low quality option. <strong>The moment you offer low quality, you are not high class any more! </strong>and believe me, you wanna stay high class or you will be soon replaced by someone even cheaper than you.
</p>

## &#8220;Tests are important, but I have to pay the mortgage&#8221;:

<p style="padding-left: 30px;">
  When producing low quality software you are ruining yours and your company&#8217;s reputation. The world is small, and besides being replaced by a cheaper alternative: <strong>How much time do you think it is needed so your fame is so bad that nobody wants to hire you?</strong> How will you pay your mortgage then? (Also: notice that guys who say these things in action movies die quite soon)
</p>

## &#8220;Tests are only needed if your team is not mature&#8221;:

<p style="padding-left: 30px;">
  Sorry, that&#8217;s bullśhit. <strong>No amount of expertise and skill will keep your code from needing to be changed in the future.</strong> Even if you have a team of geniuses, manually testing every feature every time you make a tiny change is awfully expensive. <strong>Tests are there to save you money.</strong> The most mature and skilled teams I know of, test-drive all their code.
</p>

## &#8220;Tests are only needed if you are developing your own product&#8221;:

<p style="padding-left: 30px;">
  Very simple: Having agreed that tests are important for quality, you are saying<strong></strong> that when the product is for a customer<strong></strong> <strong>you are purposely delivering low quality so you can then <span style="text-decoration: underline;">charge extra to fix it later</span> or just leave the mess for someone else.</strong> This is not only unprofessional, but also unethical.
</p>

## &#8220;The customer does not want to pay for tests&#8221;:

<p style="padding-left: 30px;">
  Some argue that the customers will not want to pay for unit tests if you tell them they represent X% of the budget or Y% of the total estimated time. You may have (or want) to specify in your budget that they will get tests, but you are not obliged to go down to that level of detail with percentage or time; <strong>Would you also specify how much time do you spend in good naming? </strong>Tests are an integral part of software, charging them separately is like your doctor charging you separately for washing his hands.
</p>

&nbsp;

And the list goes on. To end this post, I will use a quote from Michael Feathers that Leo Antoli ([@lantoli][1]) reminded to the crowd yesterday. I think it first appeared on [Working Effectively with Legacy Code][2], but also on Robert Martin&#8217;s [Clean Code][3]:

> <h2 style="text-align: right;">
>   <em>&#8220;To me, </em>legacy code<em> is simply<br /> code without tests.&#8221;</em>
> </h2>

<h2 style="text-align: right;">
  <em>-Michael Feathers<br /> </em>
</h2>

 [1]: https://twitter.com/lantoli
 [2]: http://www.amazon.com/s?search-alias=stripbooks&field-isbn=0131177052
 [3]: http://www.amazon.com/s?search-alias=stripbooks&field-isbn=0132350882