---
title: "Review: Jack Rusher @ StrangeLoop 2022: 'Stop Writing Dead Programs'"
date: 2022-12-07
categories: blog
tags:
    - review
---


# Overview

- **Type**: conference talk
- **Speaker**: Jack Rusher - https://jackrusher.com/
- **Link**: https://www.youtube.com/watch?v=8Ab3ArE8W3s


# Review

This is a talk in the 'series' of talks reminding us to step back and think about what we as IT professionals do on a daily basis. It turns out - Rusher argues - that a lot of what we do actually is quite over-complicated and time consuming. 

As examples he shows a simple operation of adding a number to an array in different programming languages. His argument is that syntax can be hard barriers or syntax can move mountains but far to often it is neglected in language design. 

The next example presented is a terminal history and keybindings - it turns out most of our keybindings, escape codes, standard character width, and so on date back to hardware long gone since decades making no sense anymore other than being backward compatible. Also - Rusher shows - 80 characters wide text is really bad at visualizing things. 

Having shown different shortcomings and anachronisms in our tool stack Rusher argues for different paradigms, especially interactive programming. Why? Because it allows for faster building since specs and requirements are always wrong and we just discover them through interaction and iteration. Also, most programming is - according to Rusher - debugging so everything that helps inspecting live code and live state and interacting with a running program is highly valuable - examples frequently used here with exceptional good interactive and inspection capabilities are Lisp and Smalltalk. 

> 'But I do not want to use Smalltalk and Lisp!'
> I am not telling you to use Smalltalk and Lisp. I am telling you that you should have programming languages thast are at least as good as Smalltalk and Lisp. 

Next argument made by Rusher is that a lot of the newish and new programming languages (C++, Go, Rust, Zip, ...) still ignore all the good developed in the past with things like Lisp, Smalltalk, Erlang and such.

Positive examples in his opinion are: Racket, Data Rabbit, Clerk, Hazel, Enso which all include interactivity with the code at runtime into the actual programming. 


