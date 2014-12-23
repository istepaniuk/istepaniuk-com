---
title: 'LINQ to SQL pitfalls: Nullable types'
author: Iván Stepaniuk
layout: post
permalink: /linq-to-sql-nullable-types-null-comparison/
lacandsnw_postmessage:
  - 
lacandsnw_twitterhandle:
  - 
categories:
  - .net
tags:
  - 'C#'
  - LINQ
  - LINQ to SQL
---
## Nullable booleans and comparisons

Testing if a nullable boolean is *true* is quite simple in C#, there are many ways, sorted here in my preference order.

<pre lang="csharp">bool? nullableBool = true;
var option1 = nullableBool == true;
var option2 = nullableBool.Equals(true)
var option3 = nullableBool.HasValue &#038;&#038; nullableBool.Value;
var option4 = nullableBool ?? false;</pre>

All options return *true* in this case, *false* for `nullableBool = false;` and also *false* for `nullableBool = null;`

However, when using this expressions is labmdas inside a LINQ to SQL projection **they will behave differently!** LINQ to SQL it is not smart enough to translate to T-SQL in a way that the current **ANSI_NULLS** setting does not affect the query result. To avoid `NULL = 1` comparisons, **don&#8217;t use option1 or option2 there!**

## Huh? Please elaborate

Consider a table in Microsoft SQL Server, with a *nullable* bit column, like this

<pre lang="sql">CREATE TABLE [dbo].[Banana] (
 [Id] int,
 [IsYellow] bit NULL,
)</pre>

I will not get into whether you should have *bit NULL* columns or not (you probably shouldn&#8217;t) but if you do, and you are using LINQ to SQL to query your RDBMS, your generated ***Banana*** entity will have an*** IsYellow*** property, of  ***bool? ***C#type***. ***Makes sense!***  
***

The following simplified code, though a little bit pointless in this case, is a perfectly valid situation if you wanted to avoid a *nullable* in your DTO, or you are projecting a boolean for any other reason.

<pre lang="csharp">ctx.Bananas.Select(x => new 
                      { 
                          Id = x.Id,
                          IsYellow = x.IsYellow == true
                      });</pre>

&#8230; but it will generate the following **ANSI_NULL OFF** dependent T-SQL code:

<pre lang="sql">SELECT [t0].[Id], 
    (CASE 
        WHEN [t0].[IsYellow] = @p0 THEN 1
        WHEN NOT ([t0].[IsYellow] = @p0) THEN 0
        ELSE NULL
     END) AS [IsYellow]
FROM [Banana] AS [t0]</pre>

If there are any rows with NULL IsYelow, this code will will generate an &#8220;`InvalidOperationException: The null value cannot be assigned to a member with type System.Boolean which is a non-nullable value type.`&#8221; This happens because the  CASE will fall through the ELSE clause for any NULL value, thus returning a NULL in the result set, unasignable to our regular non-nullable boolean.

Note that the condition `[t0].[IsYellow] = @p0, `where *@p0* is *true* and *[IsYellow]* is *NULL*, is neither true nor false according to the SQL 92 standard, this is the behavior when ** ANSI_NULLS** are are set to **ON**, wich is the default and will be actually forced ON in next versions of the MS SQL Server.

The last option will work as expected. For example:

<pre lang="csharp">ctx.Bananas.Select(x => new 
                      { 
                          Id = x.Id,
                          IsYellow = x.IsYellow ?? false
                      });</pre>

Would generate a safer NULL checking T-SQL code, like:

<pre lang="sql">SELECT [t0].[Id], COALESCE([t0].[IsYellow],@p0) AS [IsYellow]
FROM [Banana] AS [t0]</pre>

You may also want to read:

  * <a title="The SET ANSI_NULLS Reference in the MSDN" href="http://msdn.microsoft.com/en-us/library/ms188048.aspx" target="_blank">The SET ANSI_NULLS Reference in the MSDN</a>

&nbsp;