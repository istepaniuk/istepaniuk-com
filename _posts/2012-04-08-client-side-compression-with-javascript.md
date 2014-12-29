---
title: Client-side data compression with JavaScript
author: Iván Stepaniuk
layout: post
permalink: /client-side-compression-with-javascript/
categories:
  - JavaScript
tags:
  - compression
  - JavaScript
  - jSEND
  - lzw
---
When retrieving data from the server through HTTP, you can generally rely on your web server to compress the information using [gzip or deflate][1]. You can even do the trick yourself on your backend code. However, sending large amounts of data from the browser **-to-** the server, is another story.

If you need to maximize throughput for large datasets, one possible solution is to compress your JSON or XML (or whatever) using JavaScript,  then send the compressed data with the usual AJAX method and finally decompress it in the server.

[jSEND][2] is a jQuery plugin that compresses any string using a <a title="LZW" href="http://en.wikipedia.org/wiki/Lempel%E2%80%93Ziv%E2%80%93Welch" target="_blank">Lempel–Ziv–Welch</a> algorithm in the browser. A PHP class is included with the package, it is used in the backend to decompress the data.

I&#8217;ve written a <a href="https://github.com/istepaniuk/jSend-Net" target="_blank">.NET version</a> which is  an almost-literal translation of that decompression algorithm. You can find it on [my github][3].  It was successfully tested on the .Net framework 3.5, 4.0, and it also works on Mono.

Compressing and decompressing data is processor-hungry, beware that for certain small-sized chunks of data, as well as for data with a high level of entropy, it can be actually slower than sending the original uncompressed string.

{%include figure.html src="/img/jsend.png" caption="jSEND demo - screenshot from the original, now defunct web site"%}

Use [the demo][4] and paste some of your real data to see the effect. Note that LZW is very good at compressing repetitive text. Serialized data, specially collections, tend to contain repeated key names, repeated values, etc.

<a href="https://github.com/saw/JS_LZW" target="_blank">There</a> <a href="http://marklomas.net/ch-egg/articles/lzwjs.htm" target="_blank">are</a> many <a href="http://rosettacode.org/wiki/LZW_compression#JavaScript" target="_blank">other</a> LZW, <a href="http://nmrugg.github.com/LZMA-JS/" target="_blank">LZMA</a>, <a href="http://code.google.com/p/jslzjb/" target="_blank">LZJB</a> or even <a href="http://code.kuederle.com/huffman" target="_blank">Huffman</a> compression implementations. <a href="http://jsend.org/about/" target="_blank">jSEND</a> just works out of the box.

 [1]: http://en.wikipedia.org/wiki/HTTP_compression
 [2]: http://jsend.org/ "http://jsend.org/"
 [3]: https://github.com/istepaniuk/jSend-Net
 [4]: http://jsend.org/demo/
