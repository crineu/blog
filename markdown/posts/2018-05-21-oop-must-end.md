---
title: [essays] OOP must end
slug: oop-must-end
date_published: 2018-05-21T23:39:45.000Z
date_updated: 2018-05-21T23:39:45.000Z
tags: essays, programming
---

> Object Oriented Programming is an expensive disaster which must end (Smash Company)


The key in making great and growable systems is much more to design how its **modules communicate** rather than what their internal properties and behaviors should be.

> Whether you use an OOP language or a functional language, **your enemy is state**, and the goal of any kind of data-hiding is to **limit the ways that state can change**. (John Barker sums up the enemy)

In fact, OOP gives us a **vast graph of mutable objects**, all of which can **mutate each other**, with a change in any one object possibly setting off a **cascade of mutations** that propagate out through the graph in ways that are often too complicated for the human mind to comprehend.

> Favor composition over inheritance. (Joshua Bloch, in his book “Effective Java”)

**The problems with inheritance, in OOP, have become clearer over time.** It is tragic that OOP has had to retreat from such a powerful idea, to the extent that composition is now the favored strategy: Composition over inheritance (or Composite Reuse Principle) in object-oriented programming is a technique by which classes may achieve polymorphic behavior and code reuse by containing other classes that implement the desired functionality instead of through inheritance. Some languages, notably Go, use type composition exclusively.

...

Most programming languages that I am aware of offer something like a **struct** or a **record** or an **enum** or a **class** — we can use these to enforce contracts. However, whatever data structure we use, do we need the complexity that is apparent in Chad Myers example? A simple record can give us contract-enforcement, but a class comes with a whole **extra set of baggage that programmers would be wise to avoid**. Please ask yourself what is really needed here. Do we need a Service object to fetch the User for us? Do we need Dependency Inversion to set our current object with a Service object so we can fetch a last name? **Do we need OOP?**

---

### Enters Erlang (and Elixir)

> Objects bind functions and data structures together in indivisible units. I think this is a fundamental error since **functions and data structures belong in totally different worlds**. Why is this? (Joe Armstrong - inventor of Erlang)

Generally speaking, when I see the word “thesis” I think “boring”, so I had low expectations when I opened up Joe Armstrong’s thesis about the **creation of Erlang**. I only meant to skim it, but his work is surprisingly readable and I was drawn along till I had read the whole thing. **I strongly recommend it.**

### India

And there is an explicitly political idea that drove OOP to its peak in the 1990s: **the idea of outsourcing**. The idea of outsourcing software development rested on some assumptions about how software development should work, in particular the idea of the “genius” architect, backed by an army of morons who act as secretaries, taking dictation. OOP was the software equivalent of a trend that became common in manufacturing during the 1980s: design should stay in the USA while actual production should be sent to a 3rd World country. **Working with UML diagrams, writing code could be reduced to mere grunt work, whereas the design of software could be handled by visionaries, possessed with epic imaginations, who could specify an OO hierarchy** which could then be sent to India for a vast team to actually type out.

And the teams in India (or Vietnam, or Romania, etc) were never trusted, **they were assumed to be idiots**, and so, for a moment, there was a strong market demand for a language that treated programmers like idiots, and so **the stage was set for the emergence of Java**.
