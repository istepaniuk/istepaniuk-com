---
title: Using PhantomJS to make your AJAX web applications crawlable by Google
author: Iván Stepaniuk
layout: post
permalink: /phantomjs-to-make-your-ajax-web-crawlable-by-google/
lacandsnw_postmessage:
  - 
lacandsnw_twitterhandle:
  - 
lacandsnw_twitterhash:
  - 
categories:
  - JavaScript
tags:
  - AJAX
  - Google
  - Hijax
  - JavaScript
  - PhantomJS
  - SEO
---
JavaScript is playing a stellar role in web development; However, the indexing mechanisms behind search engines such as Google or Bing do not execute JavaScript. Although they may try to follow JavaScript embedded URLs, this won&#8217;t prevent your JavaScript managed content to be hidden from the search engine, depending on your case, this could be a disaster from the SEO point of view.

## What about Hijax?

This problem is not new; almost a decade ago, when JavaScript availability in the browser was something you could not rely on, an AJAX loaded content section would gracefully degrade and load as complete page if no JavaScript was at work, effectively solving the search engine problem a well. This technique was later called <a href="http://en.wikipedia.org/wiki/Hijax" target="_blank">Hijax</a>, and it requires your *backend* to be able to generate a full HTML version of what would have been otherwise rendered/composed on the browser.

If most of the HTML content is generated with the server-side tech (like in ASP.NET or PHP) I would still consider Hijax as an alternative, but if the content that you want indexed is served as JSON, XML, etc. and it never takes an HTML form until it is in the DOM, a hybrid Hijax-style solution would be expensive and complicated, let alone the case of using client-side templating engines like <a href="http://mustache.github.com/" target="_blank">mustache</a>, <a href="http://akdubya.github.com/dustjs/" target="_blank">dust.js</a>, <a href="http://handlebarsjs.com/" target="_blank">handlebars</a>, etc. This later case is the one we will talk about.

## The crawler requests

Nowadays you can count that JavaScript will be there for you when the user loads the site, but what about the search engine crawlers? Fortunately, in 2009 <a href="https://developers.google.com/webmasters/ajax-crawling/docs/specification" target="_blank">Google defined a standard</a>, which latter Bing (and thus Yahoo) also supported in 2011. It basically defines a bidirectional mapping that is applied to every URL containing #!, allowing a link to:

```
example.com/profile#!/jdoe
```

To become a GET request for:

```
example.com/profile?_escaped_fragment_=%2fjdoe
```

That new URL is what the crawler will actually request when encountering and following a link with &#8216;#!&#8217; in the anchor fragment.  This solves an important part of the problem, but we still need to generate an HTML snapshot for the crawler to download, parse, and go on. How?&#8230;

## Generating content for the crawler

The idea is to do for the crawler the job that it doesn&#8217;t want to do on it&#8217;s own, here is where <a href="http://phantomjs.org/" target="_blank">PhantomJS</a> comes in. *PhantomJS* is a full stack headless browser based on WebKit. Having a fast JavaScript enabled &#8220;browser&#8221; on the *backend* allows us to remap the Google bot request back to the #! format, and pass it to *PhantomJS*. The command-line process will return a nice HTML snapshot to the crawler, just as the users would see on their real browsers, and it will in turn contain more valid* #!* links to parse, convert and follow so the process goes on.

[<img class="wp-image-255 alignnone" title="Crawlable AJAX web using PhantomJS" src="/img/ajaxcrawl.jpg" alt="Crawlable AJAX web using PhantomJS" />][1]

Depending on your JavaScript, generating a snapshot on the server-side is probably processor-intensive, but remember that it will only be used by the search engine crawlers, and that you will have absolute control over making a snapshot or just returning the cached HTML from a previous run, which will be actually really fast.

Note that any content meant to be indexed needs to be accessible through an *<a>* element with a proper #! formated href, otherwise it can not be followed by the crawler.

&nbsp;

 [1]: /img/ajaxcrawl.jpg
