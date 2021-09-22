---
title: Writing international software is hard
author: Iván Stepaniuk
layout: post
permalink: /writing-international-software-is-hard/
tags:
  - i18n
  - l10n
  - translation
---
During the last few years I have worked with both desktop and web applications that had to be translated into other languages. While it&#8217;s generally good to delay architecture decisions, writing a -global- application like it&#8217;s only going to be used in the place where you write it, is just wrong.

It would be better if the whole team could familiarize with the implications of internationalization, **early**. Translating an application when <a title="Definitions of i18n and l10n" href="http://en.wikipedia.org/wiki/Internationalization_and_localization" target="_blank">i18n (Internationalization)</a> was not considered during the initial (or any) stages of development could be very painful and expensive.

I have compiled a set of advices to keep in mind from the beginning, most of which were learnt the hard way.

### String constants

[<img title="Rosetta Stone" src="/img/rosetta-stone.png" alt="" width="139" height="178" />][1]Great care must be taken when adding new strings to the application like a message for the user, UI caption, etc. Having to change these string constants once the translations are already in place is **expensive** and time-consuming.

In most <a href="http://en.wikipedia.org/wiki/Gettext" target="_blank">Gettext</a> and Gettext-like solutions, sightly changing a string breaks the link between the original text and the translated one. For Gettext, <a href="http://www.poedit.net/" target="_blank">Poedit</a> has a fuzzy matching algorithm to help the translator in the process of updating your translations, but you can&#8217;t expect much from fuzziness.

String literal concatenation is your enemy, different languages have different grammatical order and translating a whole sentence is much easier than translating loose words out of context.

  * <span style="color: #000000;">Have a set of style rules for messages. i.e.: Do error message sentences end with period?<br /> </span>
  * <span style="color: #000000;">Check your spelling and grammar twice when adding a new string. Check new strings in the code review, correct <strong>early.</strong></span>
  * <span style="color: #000000;">Be conservative when adding new strings. Is <em>that</em> specific error message really necessary?</span>
  * <span style="color: #000000;">Use String.Format() or your language equivalent when composing messages, <strong>do not concatenate.</strong><br /> </span>
  * <span style="color: #000000;">Avoid mandatory spaces at the start or end of a string literal (i.e.: &#8221; OK &#8220;), do use concatenation in this case to add the space if needed, keep the translatable string clean.<br /> </span>
  * <span style="color: #000080;"><span style="color: #000000;">Mixing HTML in your string literals is <b>horrible</b>, but you already know that. I hope.</span><br /> </span>

### Database strings

There are several methods to store static strings in the database in different languages, in my humble opinion the best one is called: **Don&#8217;t do that**!. All the other methods are either inefficient, cumbersome or both.

I&#8217;ve seen many times database objects containing just a primary key and a VARCHAR column for the sole purpose of identifying some other object type or status. ie: InvoiceType. These strings then end up in the user interface through zillions of intricate and slow JOINs. What&#8217;s the point in doing that if you have to maintain an enumerated type for your business logic code anyway?

  * <span style="color: #000000;">Use short identifiers<em> that make sense</em> in your database.</span>
  * <span style="color: #000000;">Use your enumerated types to generate the translated strings.</span>
  * <span style="color: #000000;">Keep your database culture-neutral.</span>

### Number and Date conversion

When the user inputs data such as floating point numbers, time, dates, etc. keep in mind at all times that the type conversion depends on the user culture, the same goes for displaying data and for input validation. Your framework has tools to handle these type conversions, study them**, use them**.

Avoid depending on your server&#8217;s locale or regional settings, your system should run fine with OS versions other than English or a POSIX locale other than your development environment.

  * <span style="color: #000000;">Keep your serialized dates and floating point values consistent and culture-neutral.</span>
  * <span style="color: #000000;">Avoid depending on the system configured locale or regional settings for type conversions.<br /> </span>
  * <span style="color: #000000;">Keep your code culture-neutral.</span>

### Time zones and calendars

It&#8217;s a common practice to use the server&#8217;s system time (i.e.: DateTime.Now() in .Net) to generate and store these timestamps or to make calculations. **Don&#8217;t. **Use the universal time whenever possible, the server could be moved to another timezone, the cloud, or <a href="http://en.wikipedia.org/wiki/Ganymede_%28moon%29" target="_blank">Ganymede</a>. .Net provides .UtcNow() and .UtcToday() for this purpose.

****There are lots of things to consider when dealing with time and offsets; week start days, DST with its variations between countries, hemispheres, leap years, even leap seconds**. **Study and use your framework&#8217;s and system tools to perform these date and time calculations, comparisons, offsets, etc. ** Don&#8217;t reinvent the wheel, **or you will end up <a title="Apple alarm clock bug" href="http://www.engadget.com/2010/12/31/psa-iphone-alarms-not-working-come-new-years-day-2011" target="_blank">like Apple.</a>**  
**

  * <span style="color: #000000;">Always use UTC, not your server&#8217;s local time.<br /> </span>
  * <span style="color: #000000;">Offset the time using the correct timezone when displaying it to the user.</span>
  * <span style="color: #000000;">Use your framework&#8217;s, platform and system tools to perform date and time calculations.<br /> </span>
  * <span style="color: #000000;">Keep your code timezone-neutral.</span>

### Everything else

This was just a glimpse. The list of things to consider is endless, things like character encodings, bi-directional text, CJK support, or specific localizations can increase complexity *ad infinitum*. There is a whole industry based on i18n, and <a href="http://i18ngal.blogspot.com.es/" target="_blank">many</a> <a href="http://www.i18nguy.com/" target="_blank">blogs</a> <a href="http://people.w3.org/rishida/blog/" target="_blank">on that</a> <a href="http://www.gala-global.org/blog/" target="_blank">subject</a> <a href="http://www.globalbydesign.com/" target="_blank">alone</a>.

It&#8217;s important that you know that **writing truly international software is hard**. It requires dedication and  specific knowledge on this topic. Writing software for the world requires an open mind.

 [1]: /img/rosetta-stone.png
