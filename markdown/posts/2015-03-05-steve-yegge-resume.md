---
title: [book] Steve Yegge resume
slug: steve-yegge-resume
date_published: 2015-03-05T05:53:00.000Z
date_updated: 2017-05-02T22:54:38.000Z
tags: books, programming
---

    A Programmer’s Rantings: On Programming-Language Religions, Code Philosophies, Google Work Culture, and Other Stuff (Steve Yegge, 2012)


#### Little note to programmers

> READ THE WHOLE BOOK

![Warning! Rant](../images/rant.jpg)


### Math for programmers

You need to learn

- **Probabilities**
- **Discrete math** (math on integers)
- **Statistics**
- **Algebra** and **Linear Algebra** (matrices)
- **Mathematical Logic** (whatever it is)
- **Information Theory** (data compression) and **Kolmogorov Complexity** (algorithmic complexity)

> I think the best way to start learning math is to spend 15 to 30 minutes a day surfing in Wikipedia. It’s filled with articles about thousands of little branches of mathematics. You start with pretty much any article that seems interesting. Start reading. If there’s something you don’t understand, click the link and read about it. Do this recursively until you get bored or tired.

---

### Get that job at Google

Long-term warm-ups:

- **Study a data-structure and algorithm book**: will help you with problem identification

- Steven Skiena’s The Algorithm Design Manual
- Introduction to Algorithms

- **Have another person interview you**: do a fake interview first; prepare yourself

#### Some Tech Prep Tips:

- **Algorithm Complexity**: you must know big-O
- **Sorting**: quicksort and merge sort, at minimum; don’t try to sort a linked list;
- **Hashtables**
- **Trees**: construction, manipulation, traversal; binary, n-ary and trie-trees.
- **Graphs**
- **Math**
- **Operating System**: processes, threads, concurrency issues; locks, mutexes, semaphores and monitors.
- **Coding**: you should know at least one programming language very well

---

#### Jeff Bezos’ Big Mandate

1. All teams will henceforth expose their data and functionality through service interfaces.
2. Teams must communicate with each other through these interfaces.
3. There will be no other form of interprocess communication allowed: no direct linking, no direct reads of another team’s data store, no shared-memory model, no backdoors whatsoever. The only communication allowed is via service interface calls over the network.
4. It doesn’t matter what technology they use. HTTP, Corba, Pubsub, custom protocols — doesn’t matter. Bezos doesn’t care.
5. All service interfaces, without exception, must be designed from the ground up to be externalizable. That is to say, the team must plan and design to be able to expose the interface to developers in the outside world. No exceptions.
6. Anyone who doesn’t do this will be fired.

---

#### Rich Programmer Food

How a compiler works. There are three separate phases

- **Parsing**: take your input and turn it into a tree
- **Preprocessing**;
- **Lexical analysis** (tokenization) usually done with regexps;
- **Syntax analysis** usually done with grammars;
- **Intermediate Representation generation**
- **Type Checking**
- **Code Generation**: code generation is pretty straightforward, assuming you know enough recursion to realize your grandparents weren’t Adam and Eve.

You should write one.
