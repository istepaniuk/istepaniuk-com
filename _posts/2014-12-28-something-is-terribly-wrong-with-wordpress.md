---
title: Something Is Terribly Wrong with Wordpress
author: Iván Stepaniuk
layout: post
permalink: /something-is-terribly-wrong-with-wordpress/
categories:
  - Idle
---

### WARNING: This is just a rant, and you should probably not read it.

This 2014 was a year of many changes, new company, new country, new house, all excellent excuses to stop writting posts! Lately, for these and other reasons I was not finding a lot of oportunities to write here. To make it even worse, every time I logged into my wordpress admin interface to write a draft or post, I remembered how hard Wordpress sucks. Really.

Some years ago I decided to start blogging and went with Wordpress. It was the obvious choice, popular, and very easy to install and use. The problem is that what you get from **Wordpress out of the box is not good enough**, at least if you are anywhere close to serious about it.

As soon as you go online the spam will start pouring down. The built-in comment system can drive you crazy when you have 1 real comment for every 1000, but that's easy, just spend half a day trying plugins until you find the one that does not cost you an eye and actually filters something.

The same goes for social buttons, analytics, your twitter card, <strike>google authorship</strike>,... **Plugin magic!**. Do you want to add some code snippets to your posts? No problem, 3 or 4 plugins latter you will find something that does not completely destroy the theme or brings the whole server down.

Wordpress releases updates quite often, but many of those installed plugins will start failing with even minor version upgrades, not only because they are hacky (some really are, even the popular ones) but because everything seems to be so tightly coupled to the Wordpress core that **they shouldn't be called plugins but grafts.** Good luck trying to keep all those updated. 17 in my case.

All these hacks slow down your site, but don't worry, there is a cache plugin to solve that! there is even a plugin to make Wordpress secure enough (WTF!) so your hosting provider does not shut you down when some script tries to brute-force your admin credentials, or when spammers bring your site to it's knees.

### Back to square one

With all those hacks, the site can respond reasonably fast for the public, but that doesn't make the admin interface any faster, specially if you are on a cheap hosting provider. Bet your bottom dollar that any support ticket about Wordpress performance is going to contain "disable all the plugins" in the very first answer.

### Questions

Given that:

* I have **less than 200KB** of written content.
* I have less than 4MB of pictures.
* The site gets an average of 100 daily sessions with only 1.2 views per sessions.
* It has very, very ocasional traffic bursts.

* Why do I need all these plugins?
* A cache plugin? Why isn't it just fast enough for this?
* A security plugin? Why isn't it secure enough?
* Why the built-in comment system is not practical even for a small site?
* **Why do I need a full-fledged RDBMS to power a simple blog?**

I just want to write some stuff, it shouldn't be so damn complicated.

### The solution
If you are not a developer or sysadmin or you would rather spend your time blogging and not dealing with this nightmare, get somebody to manage your Wordpress for you, or get a paid [wordpress.com](wordpress.com) account, or a [ghost.org](Ghost) one, etc. Running it yourself is an incredible waste of time.

If you ARE a developer or systadmin wanting to run a tech blog, **there is a solution!** it's called [Jekyll](http://www.jekyllrb.com) and I will tell about it very soon!
