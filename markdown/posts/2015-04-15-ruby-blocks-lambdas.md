---
title: Ruby Blocks & Lambdas
slug: ruby-blocks-lambdas
date_published: 2015-04-15T20:44:51.000Z
date_updated: 2017-05-02T22:55:42.000Z
tags: tips, ruby
---

### Quick Review

1. A **block** is just a bit of code between `do..end` or `{}`. It’s not an object on its own, but it can be passed to methods like `.each` or `.select`.
2. A **proc** is a saved block we can use over and over.
3. A **lambda** is just like a **proc**, only it cares about the *number of arguments* it gets and it *returns to its calling method* rather than returning immediately.

![Super Mario](../images/supermariobros.jpg)


### Almost everything is an object

**Blocks** are not objects, and this is one of the very few exceptions. Because of this, blocks can’t be saved to variables and don’t have all the powers and abilities of a real object. For that, we’ll need... **procs**!

Think of a *proc* as a saved block.

    multiples_of_3 = Proc.new do |n|
      n % 3 == 0
    end
    (1..100).to_a.select(&multiples_of_3)


#### Why Procs?

Why bother saving our blocks as procs? There are two main advantages:

- **Procs** are full-fledged objects, so they have all the powers and abilities of objects (blocks do not)
- **Procs** can be called over and over without rewriting them. This prevents you from having to retype the contents of your block every time.

Unlike blocks, we can call procs directly by using Ruby’s `.call` method.

    test = Proc.new { # does something }
    test.call
    # does that something!


#### Symbols, Meet Procs

Now that you’re learning some of the more complex parts of the Ruby language, you can combine them to work some truly arcane magicks. For instance, remember when we told you that you could pass a Ruby method name around with a symbol? Well, you can also convert symbols to procs using that handy little `&`.

    strings = ["1", "2", "3"]
    nums = strings.map(&:to_i)
    # >>> [1, 2, 3]


By mapping `&:to_i` over every element of strings, we turned each string into an integer!

---

### The Ruby Lambda

Like procs, **lambdas** are objects. The similarities don’t stop there: with the exception of a bit of syntax and a few behavioral quirks, lambdas are identical to procs.

Lambdas are defined using the following syntax: `lambda { |param| block }`

    strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
    symbolize = lambda { |x| x.to_sym }
    symbols = strings.collect(&symbolize)
    # >>> [:leonardo, :donatello, :raphael, :michaelangelo]


#### Lambdas vs. Procs

If you’re thinking that procs and lambdas look super similar, that’s because they are! There are only two main differences.

1. Checked number of arguments
- A **lambda** checks the number of arguments passed to it and throws an error if you pass it the wrong number;
- A **proc** does not check, just ignores unexpected arguments and assign *nil* to any that are missing.

2. Return behavior
- When a **lambda** returns, it passes control back to the calling method;
- When a **proc** returns, it does so immediately, without going back to the calling method.

---

> Source: [CodeSchool](http://codeschool.com)
