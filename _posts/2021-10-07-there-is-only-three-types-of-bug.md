---
title: There Are Only Three Types of Bug 
author: Iván Stepaniuk
layout: post
permalink: /there-are-only-three-types-of-bug/
tags:
  - agile
---

As soon as there is code, there will be bugs. Gojko Adzic said in a keynote in the Agile Testing Days in Berlin, almost
a decade ago;
> ... It's called an ***issue tracker*** because when you have one, then you have an issue. 

The traditional bug or "issue tracking" processes have advantages on waterfall engineering processes, but 
they have very little to do with an agile development environment. We don't need to document past bugs to avoid 
them in the future, we don't build knowledge bases of defects; we have unit tests that prevent regression.


# 1. Urgent bugs
Bugs that are so urgent as to stop whatever you are working on and start fixing it.

# 2. Important bugs
Bugs that will have the top priority as to what to work on NEXT; they are at the top of your TODO list.

# 3. Bugs that you will NOT fix
This defect is not urgent nor important as per the previous definitions and likely has been there for some time. 
If it's not important enough to be considered of type 2. then there is no need to keep this on any backlog or 
issue tracker. Close it or delete it. Adios.  

## Is it's a bug or a feature?
There is no "type 4". If fixing a bug is not important enough to be of type 2. it's unlikely that it will 
have priority over anything else in your backlog anyway. If it really does, by all means go ahead and treat the bug
as any other story, subject to the same priorities, refinement and estimation process (if you do that),
and of course the same definition of done. But for example, if you are doing Scrum and you wouldn't tackle this bug 
on your next sprint either, then I'm afraid it was of type 3.
