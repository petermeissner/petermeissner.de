---
title: "Links"
---


THE RECODE PROJECT - An active archive of computer art.
-------------------------------------------------------

http://recodeproject.com/



How to Run Linux Commands From Outside the Bash Shell on Windows 10
-------------------------------------------------------------------

Windows 10 includes an underlying “Windows Subsystem for Linux” to run Linux applications, but it’s only accessible via the Bash shell. However, there is a way to run Linux applications without first launching a Bash window.

- https://www.howtogeek.com/262086/how-to-run-linux-commands-from-outside-the-bash-shell-on-windows-10/


Example: 

```cmd
bash -c "ls -lah"
```
 

 

 

Solve Sudokus with R and PicoSAT
--------------------------------

 

-   https://www.dirk-schumacher.net/2017/07/23/solve-sudokus-with-r-and-a-sat-solver/

Recently I wrote a [small
package](https://github.com/dirkschumacher/rpicosat) to use
the [PicoSAT](http://fmv.jku.at/picosat/) solver in R. PicoSAT is a C program
written by [Armin Biere](http://fmv.jku.at/biere/index.html) that can solve the
so called [SAT
problem](https://en.wikipedia.org/wiki/Boolean_satisfiability_problem). Given a
boolean formula, such as `A OR B AND NOT C`, can we set `A`, `B` and `C` to TRUE
or FALSE such that the formula evaluates to TRUE?

It turns out many problems (such as a Sudoku) can be formulated as a SAT
problem.

Bindings for PicoSAT exist for [various
languages](https://github.com/search?utf8=%E2%9C%93&q=picosat&type=) but not for
R. Also, it seems there is currently no package for solving SAT problems on
CRAN.

 

Setting up Shiny Server
-----------------------

 

-   https://qualityandinnovation.com/2015/12/09/deploying-your-very-own-shiny-server/

 

 

Plants with R
-------------

-   https://fronkonstin.com/2017/07/18/plants/

-   https://fronkonstin.com/2017/06/26/a-shiny-app-to-draw-curves-based-on-l-systems/

 

Rstudio Server Administration
-----------------------------

-   https://www.rstudio.com/products/rstudio/download-server/

-   https://support.rstudio.com/hc/en-us/articles/200532327-Configuring-the-Server

-   https://support.rstudio.com/hc/en-us/articles/200552316-Configuring-the-Server

-   https://support.rstudio.com/hc/en-us/articles/200552326-Configuring-the-Server/

-   http://blog.trackets.com/2014/05/17/ssh-tunnel-local-and-remote-port-forwarding-explained-with-examples.html

 

 

The Coding Train - Fun and Art with Coding
------------------------------------------

-   https://www.youtube.com/user/shiffman

 

 

The Net Ninja - Youtube Channel
-------------------------------

 

-   https://www.youtube.com/channel/UCW5YeuERMmlnqo4oq8vwUpg/playlists

 

 

Famous Gang of Four Design Patterns explained with Javascript
-------------------------------------------------------------

 

For all who find JS much more readable than C++/Java-likes - e.g. me.

-   http://www.dofactory.com/javascript/design-patterns

 

 

Disabling Linux Mint Shortcuts
------------------------------

 

(Because they interfere with other shortcuts e.g. from Rstudio)

-   http://granjow.net/mint-cinnamon.html

 

 

Introduction to UNIX - "The Unix Workbench"
-------------------------------------------

-   http://seankross.com/the-unix-workbench/

 

Git Server
----------

-   http://t3n.de/news/git-eigener-git-server-544264/

 

Apache mod_rewrite
------------------

-   http://mod-rewrite-cheatsheet.com/

-   https://httpd.apache.org/docs/trunk/rewrite/remapping.html

-   http://www.askapache.com/htaccess/modrewrite-tips-tricks/

 

API in PHP
----------

-   http://coreymaynard.com/blog/creating-a-restful-api-with-php/

 

Symbolic Links on Windows
-------------------------

-   https://www.howtogeek.com/howto/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/

 

Add git branch name to bash prompt
----------------------------------

-   https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt

 

This crazy little thing called scales (D3js scales)
---------------------------------------------------

by [Jerome Cukier](https://twitter.com/jcukier)

-   http://www.jeromecukier.net/blog/2011/08/11/d3-scales-and-color/

 

Shiny: Errors and Validation
----------------------------

-   http://shiny.rstudio.com/articles/validation.html

 

Developing HTMLwidgets
----------------------

-   http://www.htmlwidgets.org/develop_intro.html

 

Inline graphics
---------------

-   https://github.com/htmlwidgets/sparkline

 

R/Travis multiple OS testing
----------------------------

-   https://ropensci.org/blog/2016/07/12/travis-osx

 

Turtle graphics with R
----------------------

-   by Thorsten Pohlert :
    https://cran.r-project.org/web/packages/trend/index.html

 

What Every Programmer Absolutely, Positively Needs To Know About Encodings And Character Sets To Work With Text
---------------------------------------------------------------------------------------------------------------

by [David C. Zentgraf](https://twitter.com/deceze) :
http://kunststube.net/encoding/

 

SparkR (social science)
-----------------------

https://github.com/UrbanInstitute/spark-social-science

R: Running something within global environment but *with* options, working directory, ...
-----------------------------------------------------------------------------------------

https://cran.rstudio.com/web/packages/withr/withr.pdf

Adding Rcpp to your roxygen2-ized R package and making it work
--------------------------------------------------------------

https://ironholds.org/blog/adding-rcpp-to-an-existing-r-package-documented-with-roxygen2/

Working with Rcpp StringVector
------------------------------

http://gallery.rcpp.org//articles/working-with-Rcpp-StringVector/

OpenStreetMap boundaries export - Hurray!
-----------------------------------------

https://osm.wno-edv-service.de/boundaries/

rJava
-----

https://www.rforge.net/rJava/

Five ways to handle Big Data in R
---------------------------------

by eoda/Oliver Bracht

http://blog.eoda.de/2013/11/27/five-ways-to-handle-big-data-in-r/

R powered web applications with Shiny (a tutorial and cheat sheet with 40 example apps)
---------------------------------------------------------------------------------------

by [Zev Ross](https://twitter.com/zevross?ref_src=twsrc%5Etfw)

[Link](http://zevross.com/blog/2016/04/19/r-powered-web-applications-with-shiny-a-tutorial-and-cheat-sheet-with-40-example-apps/?utm_content=buffer8271b&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer#style-yourself-with-css)

The R - HTMLwidgets framework
-----------------------------

\-http://www.htmlwidgets.org/develop_intro.html

Unicode character inspector
---------------------------

-   http://apps.timwhitlock.info/unicode/inspect

by [Tim Whitlock](https://plus.google.com/106703751121449519322)
[@timwhitlock](http://twitter.com/timwhitlock)

R prepared SQL statements / parametrized SQL / R SQL bulk insertion
-------------------------------------------------------------------

http://www.inside-r.org/packages/cran/RSQLite/docs/dbSendPreparedQuery

R and MS-SQL
------------

### [Jen Underwood](https://twitter.com/idigdata)

http://www.jenunderwood.com/2015/11/11/r-you-ready-sql-server-2016/

Integrating R with Web Applications
-----------------------------------

### [Jen Underwood](https://twitter.com/idigdata)

http://www.jenunderwood.com/2015/01/12/part-1-integrating-r/
http://www.jenunderwood.com/2015/02/23/part-2-r-web-apps/

Node.js / Electron / The how and what of JavaScript desktop applications
------------------------------------------------------------------------

### [Kristian Poslek](https://medium.com/@bojzi)

https://medium.com/developers-writing/building-a-desktop-application-with-electron-204203eeb658\#.gizx0a60s

How long to complete analytics academy course
---------------------------------------------

https://www.quora.com/How-long-does-it-take-to-complete-the-Analytics-Academy-courses-of-Google

Python for data science learning plan
-------------------------------------

http://www.datasciencecentral.com/m/blogpost?id=6448529%3ABlogPost%3A415409

SSH into Github wont work "Agent admitted failure to sign using the key."
-------------------------------------------------------------------------

https://help.github.com/articles/error-agent-admitted-failure-to-sign/

Generating SSH keys
-------------------

https://www.howtoforge.com/linux-basics-how-to-install-ssh-keys-on-the-shell

On dates and times in R (Naom *'The Helpful'* Ross)
---------------------------------------------------

http://www.noamross.net/blog/2014/2/10/using-times-and-dates-in-r---presentation-code.html

Data Science Notes (Dmitriy *'Parallel'* Selivanov on R and text)
-----------------------------------------------------------------

http://dsnotes.com/archive.html

Git(hub) cheat sheet
--------------------

https://education.github.com/git-cheat-sheet-education.pdf

recursive ftp download with R
-----------------------------

http://stackoverflow.com/q/5227444/1144966

Markov Chains -- Explained Visually (Victor Powell)
---------------------------------------------------

http://setosa.io/ev/markov-chains/

xmodmap
-------

HowTo xmodmap: https://wiki.archlinux.org/index.php/Xmodmap List of XF86... key
names: http://wiki.linuxquestions.org/wiki/XF86_keyboard_symbols

rOpenGov
--------

R projects concerned with political / government data.

http://ropengov.github.io/projects/

(notable) CRAN task views
-------------------------

-   [Social sciences](https://cran.r-project.org/web/views/SocialSciences.html)

    -   find all those different regression models

-   [Web
    technologies](https://cran.r-project.org/web/views/WebTechnologies.html) -
    anything for making and breaking the Web - scraping and parsing of Web
    formats - API access

-   [Official
    Statistics](https://cran.r-project.org/web/views/OfficialStatistics.html) -
    more sexy than you think - record linkage - seasonal adjustment - weighting

    -   small area estimation - imputation

-   [Machine
    Learning](https://cran.r-project.org/web/views/MachineLearning.html)

Awesome list of awesome R stuff
-------------------------------

https://github.com/qinwf/awesome-R

Nginx logging
-------------

https://www.digitalocean.com/community/tutorials/how-to-configure-logging-and-log-rotation-in-nginx-on-an-ubuntu-vps

IP address ranges / CIDR
------------------------

https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking
https://de.wikipedia.org/wiki/Classless_Inter-Domain_Routing

Likable Jekyll - Themes - That I like
-------------------------------------

### Mark Otto ([mdo](https://github.com/mdo)) :

### Gerald Bauer ([geraldb](https://github.com/geraldb)) :

### Pinocchio ([smallmuou](https://github.com/smallmuou)) :

### Motaquillah Maddane ([kronik3r](https://github.com/kronik3r)):

### Steve Smith ([orderedlist](https://github.com/orderedlist)):

Wilson et al. (2014): *Best Practices for Scientific Computing*. PLoS Biol 12(1): e1001745.
-------------------------------------------------------------------------------------------

>   Scientists spend an increasing amount of time building and using software.
>   However, most scientists are never taught how to do this efficiently. As a
>   result, many are unaware of tools and practices that would allow them to
>   write more reliable and maintainable code with less effort. We describe a
>   set of best practices for scientific software development that have solid
>   foundations in research and experience, and that improve scientists’
>   productivity and the reliability of their software.
>   [...][PDF](http://www.plosbiology.org/article/fetchObject.action?uri=info:doi/10.1371/journal.pbio.1001745&representation=PDF)
>   [DOI](doi:10.1371/journal.pbio.1001745)

Danilo Freire (2015-12-08) *Peering at Open Peer Review*. The Political Methodologist
-------------------------------------------------------------------------------------

>   Peer review is an essential part of the modern scientific process. Sending
>   manuscripts for others to scrutinize is such a widespread practice in
>   academia that its importance cannot be overstated. Since the late eighteenth
>   century, when the Philosophical Transactions of the Royal Society pioneered
>   editorial review,1 virtually every scholarly outlet has adopted some sort of
>   pre-publication assessment of received works. Although the specifics may
>   vary, the procedure has remained largely the same since its inception:
>   submit, receive anonymous criticism, revise, restart the process if
>   required. A recent survey of APSA members indicates that political
>   scientists overwhelmingly believe in the value of peer review (95%) and the
>   vast majority of them (80%) think peer review is a useful tool to keep
>   themselves up to date with cutting-edge research (Djupe 2015, 349). But do
>   these figures suggest that journal editors can rest upon their laurels and
>   leave the system as it is?
>   [...][LINK](http://thepoliticalmethodologist.com/2015/12/08/peering-at-open-peer-review/)

Checking for non-ASCII characters in R
--------------------------------------

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ r
tools::showNonASCII(readLines("filename.txt"))
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

No Energy Saving for WLAN on Pi
-------------------------------

https://www.datenreise.de/raspberry-pi-wlan-einrichten-edimax/

R's source code on Github (search-able)
---------------------------------------

https://github.com/wch/r-source

Searching through the source code of ALL packages on CRAN
---------------------------------------------------------

https://github.com/search?utf8=%E2%9C%93&q=user%3Acran&type=Code&ref=searchresults

Getting R's Source Code
-----------------------

https://cran.r-project.org/sources.html

rmarkdown: Alter Action Depending on Document
---------------------------------------------

https://trinkerrstuff.wordpress.com/2014/11/18/rmarkdown-alter-action-depending-on-document/

Listen Wikipedia by Hatnote
---------------------------

Changes to Wikipedia as sound - tune in and chill out ...

[http://listen.hatnote.com](http://listen.hatnote.com/#en)

Administrative Boundaries Datasets (shape, R, EXRI, kmz, ... )
--------------------------------------------------------------

[Global Administrative Areas - Boundaries without limits](http://gadm.org/about)

Linux pandoc for images / convert jpg to pdf
--------------------------------------------

http://www.imagemagick.org/script/convert.php

*install:*

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ bash
sudo apt-get imagemagick
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*jpg to small grey scale pdf*

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ bash
convert -density 300x300 -quality 2 -compress jpeg -colorspace Gray -colors 64 input1.jpg input2.jpg output.pdf
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

saving RasPi image
------------------

https://linuxundich.de/raspberry-pi/linux-images-fuer-den-raspberry-pi-auf-sd-karte-installieren/

AutoHotKey for Linux
--------------------

-   autokey source: https://github.com/guoci/autokey-py3

-   scripting API:
    http://autokey.googlecode.com/svn/trunk/doc/scripting/index.html

-   example scripts: https://code.google.com/p/autokey/wiki/ContributedScripts

*install:*

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ bash
sudo apt-get autokey-qt
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*"push marked text from Gedit to terminal"-autokey-script:*

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ python
# autokey/python script for pushing text from Gedit to terminal
window.activate(title=":ACTIVE:")

# get class and title of current window, save clipboard
var1    = window.get_active_class()
title1  = window.get_active_title()
oldtext = clipboard.get_clipboard()
text =""

# only execute script from Gedit
if var1 == "gedit.Gedit" : 
    var2    = window.get_active_title()
    text    = clipboard.get_selection()
    window.activate(title="Terminal") 
    
    # paste to terminal
    if var2 == "Terminal" : 
        keyboard.send_keys(text)
        keyboard.send_keys("\n")

    # go back to Gedit
    window.activate(title=title1)

# restore clipboard
clipboard.fill_clipboard(oldtext)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Adding CRAN mirror to repository list on Linux Ubuntu / Mint
------------------------------------------------------------

https://cran.r-project.org/bin/linux/ubuntu/README.html

A collection of text files on politics
--------------------------------------

http://www.textfiles.com/politics/

A CC licensed book on string manipulations in R - Gaston Sanchez
----------------------------------------------------------------

http://gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf

No Github passwords any more!
-----------------------------

http://www.tilcode.com/push-github-without-entering-username-password-windows-git-bash/

\#!/usr/bin/Rscript not working
-------------------------------

http://stackoverflow.com/questions/2920416/configure-bin-shm-bad-interpreter

adding mime type to Linux / \*buntu and changing icon
-----------------------------------------------------

http://askubuntu.com/a/56725/183446

pushing to Github without username / password input
---------------------------------------------------

http://stackoverflow.com/questions/8588768/git-push-username-password-how-to-avoid

dinosaur data and pictures
--------------------------

http://www.nhm.ac.uk/discover/dino-directory/name/a/gallery.html
