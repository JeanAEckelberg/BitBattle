Design Principles: A Crash Course
===

Written by: Jean Eckelberg

Introduction
---

This crash course is designed to introduce many of the core design principles I use when I am making architecture or design decisions at work. There will be several links for more information if you would like to do a deep-dive into any of these topics. I encourage you to follow up on these when you have time, as a strong foundation is vital to understanding the purpose of different design patterns and larger architecture decisions. 

---

The Software "-ilities"
---

Starting at the macro level, these "-ilities" define the abstract concepts that need to be considered when designing any piece of software. I am going to go over the core eight defined in ISO/IEC 25010, for a deeper dive see the links at the end of this section. (9 includes testing methods for each)

1. Functional Suitability
    > Does the software behave as needed? This is focused on the goal of the immediate need. Basically, if the software is meant to say "hello" 12 times, it should say it 12 times. Not 13, not throw an exception, not say "sup" 12 times.

2. Performance Efficiency
    > How performant is the software? Does it have `sleep(500)` after every line? Does it turn the machine it's running on into a heater?

3. Compatibility
    > Can the software be used with other software? Does it have a clear way to work with hardware if needed? Software should be designed so that more software can be made on top of it. 
4. Usability
    > Is the software clear and easy to use? Can users learn the software quickly? Is the software protected from user stupidity? Is the software accessible to all?
5. Reliability
    > Is the software able to maintain the appropriate amount of uptime? Can it recover in the event of a fault? Can it retrieve data that may have been lost in the event of a fault?
6. Security
    > Is user information protected correctly? Does the software report all actions that are taken to audit in the event of an issue? Does the software report who or what process took what actions? Does the software appropriately ensure that the identity is verified?
7. Maintainability
    > Is the application testable? Are the components reusable? Are the components able to be changed with minimal impact on others? Is the impact of changes able to be quickly identified and tested without involving the whole? How easy is it to change the software?
8. Portability
    > Is this software able to be replaced with a comparable software relatively easily? Can it work across many different environments? How difficult is it to install or uninstall? 

For More Information:
1. https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=1353217
2. http://www.softwarearchitecturenotes.com/architecturerequirements.html
3. https://en.wikipedia.org/wiki/List_of_system_quality_attributes
4. https://nimblegravity.com/blog/ilities-in-software-engineering
5. https://codesqueeze.com/the-7-software-ilities-you-need-to-know/
6. https://en.wikipedia.org/wiki/ISO/IEC_9126
7. https://www.iso.org/obp/ui/en/#iso:std:iso-iec:25010:ed-2:v1:en
8. https://blog.codacy.com/iso-25010-software-quality-model
9. https://tuskr.app/learn/software-quality-dimensions

---

DRY
---

Zooming way in, let's talk about D.R.Y, a.k.a Don't Repeat Yourself. This is a much more concrete concept than the aforementioned Software "-ilities"; However, it's full depth is often lost. The DRY principle states, "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system." Seems simple enough right? The number of times I have to fix something at work because someone did a quick "Ctrl+C, Ctrl+V", or worse, wrote a new application without appropriately syncing up the old application to centralize logic, is far higher than I ever anticipated. It is imperative that logic and data has a single source of truth. Another similar, but more forgiving, principle is the rule of three, which states that two chunks of similar code is okay, but three and it is time to refactor.


For More Information:
1. https://en.wikipedia.org/wiki/Don%27t_repeat_yourself
2. https://en.wikipedia.org/wiki/Rule_of_three_(computer_programming)
3. https://archive.org/details/isbn_9780201485677
4. https://en.wikipedia.org/wiki/The_Pragmatic_Programmer


---

Black Box Programming (Encapsulation)
---

While this principle is more oriented to Object-Oriented Programming, this idea can be applied in all situations to minimize the amount of change needed when modifying an existing program. This principle states that a component is a "black box", and that the contents of the "black box" do not need to be known to interact with it. This is import as Miller's Law states that the number of objects that a person can remember is about 7. Therefore, the number of "black boxes" that any developer should have to open to both identify and modify the software should be 7 or less. I often see new developers struggle with this the most when introduced to enterprise software. Write your code so that others only need to know the section they are modifying, and get comfortable learning applications in sections, as learning the whole is often too complex to do in one or two sittings. 

For More Information:
1. https://docs.dataaccess.com/dataflexhelp/mergedProjects/DevelopmentGuide/Encapsulation.htm
2. https://www.codecademy.com/article/black-box-programming
3. https://en.wikipedia.org/wiki/The_Magical_Number_Seven,_Plus_or_Minus_Two

---

SOLID
---

S.O.L.I.D is one of the biggest acronyms in the world of software. So let's take this one letter at a time:

* S - Single Responsibility Principle:
    > Simply put, this principle aims to isolate volatilities and areas of change to individual components. So one component does just one thing. If it does eighty-seven things, this component is a very complicated "box" to understand. 

* O - Open/Closed Principle:
    > Open for extension, but closed for modification. That is to say, components should be able to be used by others, but not changed by others.

* L - Liskov Substitution Principle:
    > This is OOP-specific, but states that any class can be replaced by its children. In practical use, it is using the most parent class in functions so that those functions will work with the maximum amount of components.

* I - Interface Segregation Principle:
    > This principle state that contracts (interfaces) for interaction between components should be split into the smallest logical grouping so that those contracts are reusable and easier to understand

* D - Dependency Inversion Principle:
    > Dependency Inversion states that components should use interfaces or parents so that each component is binding to other components via the interface contracts so that the components can be changed as long as the contract remains the same.

For More Information:
1. https://simple.wikipedia.org/wiki/SOLID_(object-oriented_design)
2. https://www.geeksforgeeks.org/system-design/solid-principle-in-programming-understand-with-real-life-examples/
3. https://www.digitalocean.com/community/conceptual-articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design
4. https://www.amazon.com/Code-Complete-Practical-Handbook-Construction/dp/0735619670

---

Clean Code
---

Clean Code is a highly debated book that has become the de facto system design reference for many. It is hard for me to summarize this any better than link 2 below, so I strongly advise you give that a read. My personal opinion on this book is that much of the advice given is rather obvious, yet every day I am cleaning out magic strings, dealing with outdated comments, getting abused by unexpected side effects, meeting functions that have multiple multi-line comments explaining each step, and more!


For More Information:
1. https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882
2. https://gist.github.com/wojteklu/73c6914cc446146b8b533c0988cf8d29
3. https://qntm.org/clean
4. https://en.wikipedia.org/wiki/Law_of_Demeter

---

Functional Programming Principles
---

Prefer functional programming (FP) approaches where possible. FP is focused on pure functions, meaning that the functions do not contain state. Furthermore, variables are immutable, ensuring that modifications are obvious and you won't be bitten by unexpected side effects. FP approaches are particularly helpful when addressing state management and multithreading. FP approaches are generally easier to debug and test due to the clear divisions of functions and the fact that they are pure. 

Interestingly, several of the points in "Clean Code" argue for FP approaches to problems... 

For More Information:
1. https://github.com/readme/guides/functional-programming-basics
2. https://www.geeksforgeeks.org/blogs/functional-programming-paradigm/

---