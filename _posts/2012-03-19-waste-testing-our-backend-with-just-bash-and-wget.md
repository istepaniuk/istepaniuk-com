---
title: 'WASTE &#8211; Testing our backend with just Bash and Wget'
author: Iván Stepaniuk
layout: post
permalink: /waste-testing-our-backend-with-just-bash-and-wget/
categories:
  - Testing
tags:
  - bash
  - testing
  - wget
---
The <a title="SaludOnNet" href="http://www.saludonnet.com" target="_blank">SaludOnNet</a> platform manages health-insurance related electronic transactions via Internet, during peak hours, the transaction rate raises considerably so the system must be prepared to withstand a high transaction rate without any delay.

We were making important changes to the code and we needed to stress test our JSON-RPC backend in a flexible manner. When we started testing it we used [GNU wget][1] with a series of bash scripts to launch tests in parallel from the Linux console. Then we added the possibility to test the answer for a specific string or matching pattern, etc.

Putting that all together we came up with **WASTE** (**W**get based **A**utomatic **S**tress **TE**sting tool), a small console tool that allowed us to run the tests we needed. We published it on Github (<a title="WASTE" href="https://github.com/istepaniuk/waste" target="_blank">https://github.com/istepaniuk/waste</a>) Together with a small usage documentation for anyone who may find our scripts useful.

 [1]: http://www.gnu.org/software/wget/ "WGET"
