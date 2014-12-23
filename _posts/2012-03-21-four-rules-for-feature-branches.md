---
title: Four rules to follow when working with feature branches
author: Iván Stepaniuk
layout: post
permalink: /four-rules-for-feature-branches/
categories:
  - Uncategorized
tags:
  - version control
---
So&#8230; your team is using a distributed version control system like [mercurial][1] or [git][2] for some time already. You feel more confident with the merging tools and processes, it seemed more complicated than your good ol&#8217; [subversion][3] at first, but now you and your team understand that you can never go back. Now what?

Because you want to release often, it&#8217;s natural to tie your DVCS to your integration and deployment system and have all your tests run automatically every time you deploy. There are many ways to work with the DVCS in this scenario, we are not going to get into that, but we use the so-called *feature branches* because it better adjusts to our particular team and present situation. We keep the feature branches as small (short-lived) as possible, and follow a set of rules that helps us dealing with this combined processes. I wanted to share those rules with you:

**#0** &#8211; *default* (or *master*, in git) must be deployable to the UAT environment at any time, this means all the unit and integration tests must be <span style="color: #008000;">GREEN</span> at all times in this branch.  
**#1** &#8211; Merge to *default* as soon as possible, but always obey #0.  
**#2** &#8211; Keep your feature branch updated, otherwise #1 will be painful afterwards.  
**#3** &#8211; If your branch lives longer than expected or involves big changes, take advantage of all the points along the way where it is safe to meet #1, including #0. Do it.

Some related things you <span style="text-decoration: underline;">want</span> to read:

  * [FeatureBranch][4] by Martin Fowler.
  * [FeatureToggle][5] by the same guy.

 [1]: http://mercurial.selenic.com/
 [2]: http://git-scm.com/
 [3]: http://subversion.tigris.org/
 [4]: http://martinfowler.com/bliki/FeatureBranch.html
 [5]: http://martinfowler.com/bliki/FeatureToggle.html