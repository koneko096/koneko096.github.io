+++
categories = ["software development"]
tags = ["architecture", "coupling", "clean code"]
date = "2021-08-25"
title = "Make Wet Code Great Again"
type = "posts"
+++

Almost every developer I have talked to, agree if redundancy is a smell of bad code. Most of them, then will suggest to put similiar code into one function, or class, or module. Sometimes, into another generic "util" class which used across multiple modules. It is also the one of most popular point introduced in infamous Clean Code book.

To be honest, this [DRY principle](https://www.oreilly.com/library/view/97-things-every/9780596809515/ch30.html) mostly come very handy to smell any sign of improper coupling. It is also nice way to encapsulate knowledge into one place and prevent doing modification in many places. But, I must emphasis that is must be done with caution.

Smell is not meant to be pursued. Smell is a sign. It is a good chance your code was gotten bad if duplication occurs a lot, but not everything must be abstracted away into one line function, for example. Take a step back and revisit your module dependencies is a better option. [Bad abstraction](https://dev.to/nettab/we-should-all-be-writing-wet-code-3d95) will throw your chance to encapsulate your module properly. The entire code can turn into giant mudball, with every pieces connected to another.

On distributed thing, it become even worse. It may be good if executed properly to leverage platformization over entire organization. But, it may become horrendous singularity no one can ever hope to modify without impacting any other part of system, leading to slower development, and more failures. Happy WET-ting!!

{{< youtube cqKGDpnE4eY >}}
