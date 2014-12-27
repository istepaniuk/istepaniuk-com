---
title: 'Refactoring Dojo: The Gilded Rose Kata'
author: Iván Stepaniuk
layout: post
permalink: /refactoring-dojo-the-gilded-rose-kata/
categories:
  - Agile
  - Community
  - JavaScript
tags:
  - coding dojo
  - craftsmanship
  - gilded rose
  - kata
---
Last week Rafael de Castro ([@rafadc][1]) and I facilitated a <a title="Coding Dojos Are Great" href="/coding-dojos-are-great/" target="_blank">Coding Dojo</a> for the Madrid Software Craftsmanship <a title="Madrid Software Craftsmanship on Meetup" href="http://www.meetup.com/madswcraft/" target="_blank">meetup</a> group (219 members and growing every week!) in which we participate. The idea was to make a Dojo in which we could practice refactoring.

{% include figure.html caption="Iván Stepaniuk standing in the back, and some Madrid Craftsmen and Craftswomen at work!" src="/img/ivan-stepaniuk-dojo.jpg" %}

It went pretty well! This is the second time we meet in the <a title="MediaLab Prado" href="http://medialab-prado.es/article/que_es" target="_blank">MediaLab Prado</a> in Madrid, a &#8220;citizen laboratory for the production, research and dissemination of cultural projects that explore collaborative forms of experimentation and learning that have emerged from digital networks.&#8221;, founded by the Madrid City Council, **COOL!**

For the Dojo we have chosen a well known Kata called &#8220;Gilded Rose&#8221;, it is a very simple piece of software that updates the quality value of the items in a store following some simple business rules. The problem is that **the code sucks**, we are asked to add a new feature but the code is so horrible that you don&#8217;t even know where to start.

{% include figure.html caption="Rafael de Castro Facilitating the Refactoring Dojo" src="/img/rafa-de-castro-dojo.jpg" %}

We had limited time, so we choose JavaScript, that way nobody would have to install anything special on their computers, and everybody has a text editor and a browser to launch <a title="Jasmine" href="http://pivotal.github.io/jasmine" target="_blank">Jasmine</a>, right?. We distributed several pen drives with the same copy of the code plus a working test runner. And because we wanted to focus on the refactoring techniques I also included the tests, already passing.

## The schedule

(at least the planned one!)

  * **20m:** Introduction to the exercise, explaining the problem.
  * **05m:** Distributing the USB pen drives and asking the attendees to sit in pairs, trying that people that has more experience sits with people that does not.
  * **40m:** Pomodoro 1
  * **15m:** Break: Group discussion on the problems they have found, connecting some of the computers to the projector so the teams explain what are they doing.
  * **40m:** Pomodoro 2, **changing pairs**!
  * **20m:** &#8220;Show me the code!&#8221; We collected every solution on pen drives each pair shows it on the screen and explain their refactors to the group.
  * **05m:** Conclusions, Short retrospective, closing.

Protip: ask the people to bring their [WeirdAppleConnector] to VGA adapters if they have them! Also, for the final &#8220;show&tell&#8221;, it&#8217;s easier to collect the code in pen drives again than to connect many laptops to a projector.

## The code

The Kata code is on <a title="The code on github" href="https://github.com/istepaniuk/gilded-rose-js-with-tests" target="_blank">my github account,</a> where you can also find a folder named &#8216;solutions&#8217; that contains 8 of the solutions that were written during the Dojo. In most of the cases, 3 people participated in writing the code because pairs where swapped in the break.

### Happy hacking!

 [1]: http://twitter.com/rafadc "Rafael de Castro on twitter"
