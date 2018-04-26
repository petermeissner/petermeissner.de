---
title:  "Robotstxt Update - v0.6.0 on CRAN"
date:   2018-02-11 13:16:01
categories: blog
tags:
    - rstats
    - robotstxt
---


I just got the news from the CRAN-team that the robotstxt version update 0.6.0 
was accepted and now is available. 

The robotstxt package aims at working with robots.txt files from within R by 
providing a parser as well as a permission checker - and some convenience 
goodies working behind the scenes.

This new version switches the default checking backend from an pure R 
implementation (done by myself) to a C++ implementation (done by [Moz](https://github.com/seomoz/rep-cpp) and wrapped by [Bob Rudis](https://github.com/hrbrmstr/spiderbar)) that is both executing much faster 
and also much more rigourous in interpreting the the standard ([RFC](http://www.robotstxt.org/norobots-rfc.txt)). While it was hard to throw 
away so much of my own work it also is very liberating to now have to 
maintain lesser code and leaving the package with the feeling that it now is 
in a better state (more robust) than before. 

Thanks CRAN, thanks Bob, thanks Moz.
