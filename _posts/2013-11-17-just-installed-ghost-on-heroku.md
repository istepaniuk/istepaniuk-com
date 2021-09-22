---
title: Just Installed Ghost on Heroku!
author: Iván Stepaniuk
layout: post
permalink: /just-installed-ghost-on-heroku/
tags:
  - javascript
  - ghost
  - heroku
---
### <a title="This post Ghost, on Heroku" href="http://istepaniuk.herokuapp.com/just-installed-ghost-on-heroku/" target="_blank">Check it out!</a> (And you can continue reading there, it is a copy of this post)

I was looking for alternatives to WordPress for my blog, I wanted it to be:

  * Opengraph compatible
  * Good SEO support
  * Markdown based
  * Fast

In my search, I&#8217;ve found <a href="http://www.tryghost.org" target="_blank">Ghost</a>, it was REALLY fast on my old laptop and It seemed like a nice oportunity to give Heroku a try.

I always liked the heroku concept, and my current <a href="http://www.quijost.com" target="_blank">hosting</a> does not support Node.JS anyway (though it does suport Python and Ruby!)

Editing text on Ghost is just awesome! Writting in markdown with side-by-side instant preview, is just awesome. Check it out at their site, or watch the video.

<p><iframe src="//www.kickstarter.com/projects/johnonolan/ghost-just-a-blogging-platform/widget/video.html" height="480" width="640" frameborder="0" scrolling="no"></iframe></p>

Ghost is free and open source, they also plan to have their own hosting service, similar to wordpress.org, I guess.



# Asking for trouble

I had to crazy-patch Ghost to make it work on Postgres as this database is not yet supported. It comes with SQLite as default and besides that, it only supports MySQL officially.

**It is not a good idea to run Ghost on a free Heroku account**, as MySQL is not available and your uploaded images will be erased by the Heroku&#8217;s ephimerous filesystem.

In any case, Ghost is probably my next blogging platform.
