---
title: Looking back, my first web page
author: Iván Stepaniuk
layout: post
permalink: /looking-back-my-first-web-page/
categories:
  - Idle
tags:
  - retro
  - web design
---
Like many other geeks I know, I store and backup files *forever*. I just found a ZIP file containing my first website, the first on-line one that is. I've put this ugly monster together when I was 13 years old, circa 1997! I had fun opening it now and taking a look.

At first I thought of making this post private and show it only to my friends, then I realized that besides how ugly and silly the website was, not a lot 13 year old kids where doing HTML  back in the 90s. So here it is! feel free to laugh at it with me.

## Some historical context

  * Google.com did not exist yet! I was using <a href="http://en.wikipedia.org/wiki/AltaVista" target="_blank">AltaVista</a> and Yahoo.
  * **H**o**TM**ai**L** was still written like that,  H.T.M.L, and it had nothing to do with the Redmond guys yet.
  * By that time, I still had Windows 95, and  **Internet Explorer 3.0**, yay!
  * I had a 28.800Kbps  modem at home. V.34 US Robotics. Dazzling fast.

The site was about video game console emulation, and it basically contained reviews and links to other sites where you could actually download things.  The all-static site was hosted at the now defunct <a href="http://en.wikipedia.org/wiki/GeoCities" target="_blank">Geocities</a>, with some very long URLs, for free, but with very limited space.

## How it looked like

Or at least how it looks now in the beta chromium browser for Linux.
Probably quite different from what it looked like in IE3.0 and 4.01

[<img class="alignleft size-full wp-image-78" title="GameKingdom Screenshot" alt="" src="/img/Screenshot-at-2012-04-10-232911.png" width="725" height="801" />][1]

What a horrible name! The broken images were external, including the large banner at the top that was part of some banner interchange site.

The site was written in both Spanish and [*Eng**r**ish*][2], just duplicating everything every time. I did not really speak English back then, and for what I can see in some of the other pages, I was not very good at writing it either. Not that I improved that much anyway :-)

There was a newsletter! with 4 subscribers or so, but it was not really monthly.

## The code

The dark ages of web design. Frames.

```html
<HTML>

<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <meta name="Author" content="Ivan Stepaniuk" />
  <meta name="Description" content="ROMs links and emulators" />
  <meta name="Keywords" content="roms, emulation, sega, genesis" />
</HEAD>

<FRAMESET COLS="25,75"  BORDER=0 FRAMEBORDER=NO FRAMESPACING=0>
  <FRAMESET ROWS="800,*"  BORDER=0 FRAMEBORDER=NO FRAMESPACING=0>
    <FRAME SRC="navbar.html" name="navbar" noresize scrolling=auto>
  </FRAMESET>
  <FRAMESET ROWS="800,*"  BORDER=0 FRAMEBORDER=NO FRAMESPACING=0>
    <FRAME SRC="mframe.html" name="Main"  noresize scrolling=auto>
   </FRAMESET>
</FRAMESET>

<NOFRAMES>
  <h1>Sorry.</h1>
  <p>
    You need a frames capable browser to view this page
    The non frames version is not available
  </p>
  <p>
    Mailme at <a href="mailto:pirp9@geocities.com">pirp9@geocities.com</a>
  </p>
</NOFRAMES>

</HTML>
```

At some point in time I switched to Internet Explorer 4, and that came with Microsoft FrontPage Express 2.0, it was a horrible thing, but using the WYSIWYG editor and then tinkering with the generated markup seemed like a good way to start.

The layout was constructed with `<TABLE>` elements, a common practice back then, and all the colored text in the HTML was made with `<FONT>` tags, like this:

```html
<FONT size="3" color="#8080ff">
  These roms are <b>not working.</b>
</FONT>
```

Changing anything was really painful. There was no JavaScript except for some `window.status` magic, and all the forms pointed to *Geocities* form-to-mail CGI. Try that nowadays and it will fill your inbox with spam in just a few minutes. Learning some CSS took many more years.

### Don't panic!
I used one of these too:
<a href="/img/underconstruction.gif"><img class="alignleft  wp-image-80" style="margin-left: 30px; margin-right: 30px;" title="underconstruction" alt="" src="/img/under-construction.gif" width="38" height="38" /></a>

 [1]: /img/Screenshot-at-2012-04-10-232911.png
 [2]: http://en.wikipedia.org/wiki/Engrish
