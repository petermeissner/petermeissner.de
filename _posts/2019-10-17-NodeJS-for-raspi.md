---
title: "Installation of NodeJS on RaspberryPi - Keep it Simple"
date: 2019-10-17
categories: blog
tags:
    - raspberrypi
    - software
    - installation
    - nodejs
---


Googling for "`install nodejs raspi`" I get millions of blog post telling me 
how to best install NodeJS on a RaspberryPi. Well and this is yet another. 

The blog posts often explain how to get the newest version and results range 
from proposing version 6.x.x up to version 12.x.x as newest - 
some using a browser, some using the command line interface. 

I think: **Its all to complicated.** Raspian already comes with a NodeJS version 
available via package manager. So, my humble advise to future me and to all
those tinkerers big and small: Go tinker some more and use whichever NodeJS
version is available via `apt`. 

```bash 
sudo apt update
sudo apt upgrade
sudo apt install nodejs -y
node -v
## v10.15.2
```

