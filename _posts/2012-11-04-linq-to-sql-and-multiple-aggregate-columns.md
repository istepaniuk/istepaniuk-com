---
title: LINQ to SQL and multiple aggregate columns
author: Iván Stepaniuk
layout: post
permalink: /linq-to-sql-and-multiple-aggregate-columns/
lacandsnw_postmessage:
  - 
lacandsnw_twitterhandle:
  - 
lacandsnw_twitterhash:
  - 
categories:
  - .net
tags:
  - 'C#'
  - LINQ
  - LINQ to SQL
---
The following very simple T-SQL query will return the average value for all values in the *Rating* column:

```sql
SELECT AVG(Rating) AS AvgRating FROM CarRating;
```

Doing this in LINQ to SQL is quite trivial; The *Average* method returns the average from the numeric sequence:

```javascript
var avgRating = Ctx.CarRatings.Select(x => x.Rating).Average();
```

## The problem:

In the following example, we select an additional aggregate to get the maximum value of the whole Rating column in addition to the average:

```sql
SELECT AVG(Rating) AS Average, MAX(Rating) AS Maximum FROM CarRating;
```

In this case however, writing a LINQ to SQL equivalent is not that easy, one option would be splitting the query in two LINQ sentences. This is the most readable way to express what we want (and I like that), but hits the database twice and in some circumstances, specially if your table is big, you may not be able to live with that.

```javascript
var avgRating = Ctx.CarRatings.Select(x => x.Rating).Average();
var maxRating = Ctx.CarRatings.Select(x => x.Rating).Max();
// Voila
```

## The hack:

I refused to believe that there is no -good- way to express this simple SQL sentence in LINQ to SQL without hitting the DB twice. The only solution I have found so far, and the intertubes seem to agree, is to use a *group by* clause in the sentence. You would say; *group by* what? Well&#8230; that&#8217;s exactly the problem, it does not really make any sense, but if you *group by* a constant (!)&#8230;

```javascript
var ratings = Ctx.CarRatings
                 .GroupBy(uselessConstant => 0)
                 .Select(r => new
                    { 
                      Avg = r.Average(x => x.Rating),
                      Max = r.Max(x => x.Rating)
                    })
                 .FirstOrDefault();
// Voila (WTF!)
```

This works, but remember that *good code is readable code*, naming the .GroupBy() lambda with something horrible like *uselessConstantThatAllowsSelectingTwo-AggregateColumnsWithoutHittingTheDbTwice*, is better that breaking the WTF-o-meter in a code-review or future maintenance. A comment may also be opportune in this case, perhaps even a link to this post ;)

Any comments or thoughts are welcome! Specially if you have a better way to solve this.
