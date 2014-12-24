---
title: DeskSurfing at Alea
author: Iván Stepaniuk
layout: post
permalink: /desksurfing-at-alea/
lacandsnw_postmessage:
  - 
lacandsnw_twitterhandle:
  - 
categories:
  - Agile
  - Idle
tags:
  - desk surfing
  - desksurfing
  - pair programming
---
The development team at <a href="http://www.alea-soluciones.com/" target="_blank">Alea Soluciones</a>, nicknamed &#8216;Bifer&#8217;, invited me to join them for a <span style="text-decoration: underline;">DeskSurfing</span> (soon a short article on this topic). So, last week I have spent two days at Alea, pair programming with their team and test-driving some new features, it was great!

## Day 1:

We started with some organization news from Eduardo, immediately followed by the daily meeting. Alberto and Nestor Salceda ([@nestorsalceda][1]) were connected via <a href="http://www.google.com/+/learnmore/hangouts/" target="_blank">Google Hang Out</a>, tasks where discussed and we set them up on <a href="https://trello.com/" target="_blank">Trello</a>, **ready to go!**

Then after a fast coffee, Guillermo and I dived into adding a feature to their telephony monitoring system. The new feature required some minor changes through various components so I got a good big picture of their architecture, message passing, templating system, etc.

We grabbed some salad for a fast lunch, and at the end of the day we toured their offices a little more. We stopped at their laboratory, where they have a small version of what a cable operator would have. This setup allows them to test against the real thing. Really interesting stuff I would say.

## Day 2

Again, daily meeting to start. This time Alberto was in the office, we discussed the outcome of Day 1 tasks , this time I had to participate! After the meeting, I grabbed some coffee and met with the team to discuss a performance improvement for a <a href="http://en.wikipedia.org/wiki/Provisioning" target="_blank">provisioning</a> system. I paired with Alberto with that specific task, and we rewritten the tests to pull data from <a href="http://redis.io/" target="_blank">Redis</a> instead of querying hardware via SNMP. Then after a quick lunch I paired with Eduardo continuing a similar task.

Funny fact: Sometimes I use the <a title="Command-line interface" href="http://en.wikipedia.org/wiki/Command-line_interface" target="_blank">CLI</a> as an example for an alternative DM (delivery mechanism) to enforce decoupling the DM from the Application;  Alea *does actually have a* CLI as an alternative DM for some of their applications. DM Decoupling FTW!

## I liked:

**Unit tests were *really* fast**, so ridiculously fast that you can run ALL tests with <a href="http://linux.die.net/man/1/watch" target="_blank"><em>watch</em></a> in the command line (even glued with *<a href="http://en.wikipedia.org/wiki/Growl_%28software%29" target="_blank">growl</a>*, gnome *notify* or similar) and forget about it while you work on the code. By the way, integration tests where super fast also. That&#8217;s the way!

Their deployment infrastructure allowed them to** deploy in less than a minute** to any environment, from the command line. Awesome.

<a href="http://martinfowler.com/bliki/FeatureToggle.html" target="_blank">Feature toggling</a> allowed them to deploy deactivated features, and give the marketing/business people the control over the &#8220;feature switches&#8221; whenever they see fit, and for individual customers at a time. Double awesome.

Their development team is small, skilled and tightly packed.** Information flows freely** in their office, via <a href="https://trello.com/" target="_blank">Trello</a>, and via their daily meetings with Google <a href="http://www.google.com/+/learnmore/hangouts/" target="_blank">Hangout</a> with the people that are working remotely.

## My homework:

<a href="http://www.rabbitmq.com/" target="_blank">RabitMQ</a> as a message queue to connect different applications in an decoupled way looks very good. SaludOnNet has many application contexts that share data, and independent deployability is very important to us. **The way the Alea team deals with this could be potentially applied to improve our own architecture.**

## Outside my comfort zone:

I have really struggled to keep up with this guys&#8217; business domain. Lots of acronyms are part of their ubiquitous language, take a look at the content table of <a href="http://en.wikipedia.org/wiki/Passive_optical_network" target="_blank">this wikipedia article</a> and you will see what I am talking about. It took me more than a day to get fluent with their domain, or at least with the part they were working on. **Pair programming proved fundamental for this knowledge transfer.**

This domain knowledge handicap and some rusty/lacking python skills of mine were putting my brain to good use. I mean, <span style="text-decoration: underline;">all</span> of my brain. Nonetheless, patterns, TDD and refactoring techniques where in general very similar to what I do in *JavaScript* or C# every day.

Some of our work required to interact with real hardware via <a href="http://en.wikipedia.org/wiki/Simple_Network_Management_Protocol" target="_blank">SNMP.</a> This made end-to-end testing more difficult because their initial state could not be always trusted. When something went wrong, we were sometimes doubting about the problem being in the new code, or in some hardware configuration out of our control.

The one hour+ commute to their offices proved painful compared to my 20 minute-ish daily commute, made me think about some colleagues at *SaludOnNet* that do that every day.

<div id="attachment_434" style="width: 636px" class="wp-caption alignleft">
  <a href="/img/desksurfing-alea-big.jpg" target="_blank"><img class=" wp-image-434    " title="Guillermo Pascual, Iván Stepaniuk, Alberto Pérez, Eduardo Ferro - Click to enlarge" alt="Guillermo Pascual, Iván Stepaniuk, Alberto Pérez, Eduardo Ferro" src="/img/desksurfing-alea.jpg" width="626" height="469" /></a>
  
  <p class="wp-caption-text">
    Left to right: Guillermo Pascual (<a href="https://twitter.com/pasku1" target="_blank">@pasku1</a>), myself &#8211; Iván Stepaniuk (<a href="https://twitter.com/istepaniuk" target="_blank">@istepaniuk</a>),<br /> Alberto Pérez (<a href="https://twitter.com/APA42" target="_blank">@APA42</a>) and Eduardo Ferro (<a href="https://twitter.com/eferro" target="_blank">@eferro</a>) at the <a href="http://www.alea-soluciones.com/" target="_blank">Alea Soluciones</a> offices.
  </p>
</div>

**Thanks **guys for opening your doors and for this excellent opportunity. Looking forward to have you DeskSurfing our offices soon!

 [1]: http://twitter.com/nestorsalceda