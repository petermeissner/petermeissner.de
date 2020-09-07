---
title: "R Internet: Yet Another Way To Send Emails On Windows"
date: 2020-09-07
categories: blog
tags:
    - rstats
    - web
    - email
    - curl
    - docker
    - windows
---

**Intro**

Using email to send notifications seems old school nowadays. Quite often its 
nonetheless a tool that is available and accepted in many settings and where 
recipients are already familiar using it. 

While sending emails from Linux machines is quite easy, sending them from Windows
always has been is a little bit tricky. Windows neither ships with with SMTP 
servers (Simple Mail Transfer Protocol) nor has it a tradition of using 
package managers for easily and reliably installing additional software and 
services. 

There are several solutions to to sending emails on Windows. Most of them 
involve connecting to a remote SMTP server or API some others 
wrap around dedicated programs like e.g. blat. This blog post on 
[mailtrap.io](https://blog.mailtrap.io/r-send-email/) lists a lot of 
possibilities ([also here](https://datawookie.netlify.app/blog/2019/05/emayili-sending-email-from-r/), [and here](https://mdneuzerling.com/post/how-i-d-like-to-send-an-email-from-r/)). 


**Sending Emails with {curl} and Docker**

Now, let us add another way which I find has some nice properties. 
Why? 

- Because it allows to send emails directly from my local computer. 
- It allows for clean installation and removal of software.  
- With a little effort the whole process can be scripted meaning that installation is automatically transparent and automated. 
- It's easy to switch email backends as well as to port it to Linux machines e.g. to put into production. 
- It does not need any credentials to work. 

What do we need?

- The {curl} package to handle the SMTP protocol. 
- [Docker](https://www.docker.com/) to provide a container infrastructure on which to run Linux distributions for a painless installation 
experience. 
- The smtp DOCKERFILE by bytemark, e.g. (see [here](https://hub.docker.com/r/bytemark/smtp/dockerfile), [and here](https://github.com/BytemarkHosting/docker-smtp)) providing the recipe to install and run a SMTP server 
as Docker container - in this case exim.


Now, on the commandline we can ask docker to retrieve everything to create a 
image (`docker create`) for us
based on `bytemark/smtp` and 
name it mail (`--name mail`).
To ensure we have excess to the SMTP server within the container 
we furthermore ask Docker to expose port 25 
such that it can only be accessed locally `-p 127.0.0.1:25:25`.

```cmd
docker create --name mail -p 127.0.0.1:25:25 bytemark/smtp 
```

With the following we can start a container.

```cmd
docker start mail
```

This let's us get an overview over running containers. 

```
docker container ls
```

This allows for first stopping and than deleting the container.

```cmd
docker stop mail
```

When the container is running we can use {curl} to send emails from our local 
computer via the instant SMTP server to whatever email recipient. 

```r
library(curl)

send_mail(
    mail_from = "peter@local.mypc", 
    mail_rcpt = "recipient@domain.com", 
    message   = "Subject: Welcome\nGreetings from Windows.\n"
)
## $url
## [1] "smtp://localhost"
## 
## $status_code
## [1] 250
## 
## $type
## [1] NA
## 
## $headers
##   [1] 32 35 30 20 4f 4b 0d 0a 32 35 30 20 41 63 63 65 70 74 65 64 0d 0a 33 35 34 20 45 6e 74 65 72 20 6d 65 73 73 61 67 65 2c
##  [41] 20 65 6e 64 69 6e 67 20 77 69 74 68 20 22 2e 22 20 6f 6e 20 61 20 6c 69 6e 65 20 62 79 20 69 74 73 65 6c 66 0d 0a 32 35
##  [81] 30 20 4f 4b 20 69 64 3d 31 6b 46 49 35 7a 2d 30 30 30 30 33 72 2d 4c 62 0d 0a
## 
## $modified
## [1] NA
## 
## $times
##      redirect    namelookup       connect   pretransfer starttransfer         total 
##      0.000000      0.000066      0.000069      0.000000      0.004420      0.012461 
## 
## $content
## raw(0)
```


**Caveats**

One draw back of all solutions not using a proper email providers is that messages most likely will be flagged as spam.
Well, sending emails from some random IP address is rather suspicious - don't you think - it literally could be anyone doing this?! 
