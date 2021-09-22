---
title: Sentinel Values Considered Harmful
author: Iván Stepaniuk
layout: post
permalink: /sentinel-values-considered-harmful/
tags:
  - design
---

### TL;DR:
Sentinel values and other kinds of "flag" values have no place in modern languages, use types!

### A bit longer:
In languages like C, it is common to use [sentinel values](https://en.wikipedia.org/wiki/Sentinel_value),
sometimes also called flag value, signal value, etc., as a way to interrupt a loop. It is also common 
to return negative values as a way to indicate an error condition where positive values indicate that
things went well.

```c
int find(int buffer[], size_t len, int value)
{
    for (int i = 0; i < len; i++) {
        if (buffer[i] == value) {
            return i;
        }
    }
            
    return -1; // not found!
}
```

This makes a lot of sense in C or even straight assembler; the CPU can very quickly determine 
whether a value is positive and branch conditionally. 

You will find similar APIs in modern languages as well, such as Python's `find()`, that keep 
the tradition alive:
```python
"an apple, a pear and a banana".find("orange")  // -1
```

However, when writing your own code in a typed language, this is just an anti-pattern, and a clear
indication that [you are using primitives where you should not](https://refactoring.guru/smells/primitive-obsession). 

So for example in Java, instead of doing:
```java
public int findCustomerIdByUsername(Username username) {
    for (Customer customer : this.customers) {
        if (customer.getUsername().equals(username)) {
            return customer.getId();
        }
    }
    
    return -1;
}
```

Consider the much safer:
```java
public CustomerId findCustomerIdByUsername(Username username) {
    for (Customer customer : this.customers) {
        if (customer.getUsername().equals(username)) {
            return customer.getId();
        }
    }
    
    return new NullCustomerId();
}
```

In this case, using a [null object pattern](https://en.wikipedia.org/wiki/Null_object_pattern#Java) (but
a `throw new CustomerNotFoundException()` might be the best choice in some circumstances).
