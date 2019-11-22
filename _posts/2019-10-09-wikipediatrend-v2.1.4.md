---
title: "Wikipedia Page View Statistics Late 2007 and Beyond"
date: 2019-10-09
categories: blog
tags:
    - rstats
    - package
    - statistics
    - Wikipedia
    - data
    - API
---


# The {wikipediatrend} package


This blog post covers the major release of the [{wikipediatrend}](https://cran.r-project.org/web/packages/wikipediatrend/index.html) package - namely version 2.1.4. 

&#10084; Thanks to all CRAN people &#10084;



# The History 


## Introduction 

[{wikipediatrend}](https://cran.r-project.org/web/packages/wikipediatrend/index.html) dates back to late 2014. It is my first R package making it to CRAN and at this time it was the first and only R package to allow 
access to Wikipedia page view statistics from within R. 


Wikipedia is a repository of vast amounts knowledge. 
Also, it is one of the world's most used web pages. 
So, numbers on page visits are fun to play with and of public interest at the same time. 
In addition Wikipedia and Wikipedia page views are subject to and of
scientific research. 
Page views in particular have a history of serving as measure of public interest and thus provide a basis for public attention research in e.g. sociology, politics, economics, ..., and so on. 


## Data Dumbs

Wikipedia page view log dumbs can be downloaded from 2007 onwards from the following pages: 

- https://dumps.wikimedia.org/other/pagecounts-raw/
- https://dumps.wikimedia.org/other/ /. 

These dumbs are HUGE and not really suit for analyses (~20 TB of compressed text files or ~200 TB of uncompressed data):

- files are per hour aggregates of server requests
- all wiki projects are in one file 
- all languages are in one file
- labels are raw (bytes) server requests instead of standardized article titles
- download bandwidth is limited 


## Data Wrapper

Back in 2014 an external page - stats.grok.se - took on the effort to provide daily page view aggregates. 
Data was available from December 2007 onwards. 
While the admin of the page did put in the hours to provide data in a clean way, [{wikipediatrend}](https://cran.r-project.org/web/packages/wikipediatrend/index.html) provided a wrapper to access the data. 
The aim was - and still is nowadays - to provide analytics ready data in neat data.frames. The user specifies what she wants and the packages does all the rest:

- sending web requests 
- parsing response data 
- rectangularizing the data
- caching to keep the traffic burden at a minimum

## Dark Years

In late 2015 early 2016 several things happened within a couple of months: 

- Wikipedia choose to provide a (high performance) page views web API themselves. &#127881;
- Wikipedia provided there very own convenience R wrapper [{pageviews}](https://cran.r-project.org/web/packages/pageviews/index.html) to the page views web API. &#128077;
- [{wikipediatrend}](https://cran.r-project.org/web/packages/wikipediatrend/index.html) followed suit by binding both data 
sources since Wikipedia's own wrapper only provided data from late 2015 onwards. &#9989;
- Later on in 2016 stats.grok.se went down and [{wikipediatrend}](https://cran.r-project.org/web/packages/wikipediatrend/index.html) again followed suit and coped with the changes. &#128557;



From 2016 onwards [{wikipediatrend}](https://cran.r-project.org/web/packages/wikipediatrend/index.html) only provided a wrapper to the official API plus some further convenience features like the following: 

- a function to query available languages for an article 
- a somewhat smoother and less low level data retrieval flow

During 2016 expectations were, that Wikipedia would extend its API to 
fill the gap that was left behind by stats.grok.se going out of service - providing 
page views for late 2007 up to late 2015. During 2017 I was trying to convince Wikipedia's analytics team to take on the task of providing the data. Wikipedia, I thought, is root source of the data. This is the right place to build a data pipeline for this. Providing hardware is easier for an organization than for an individual, I thought. And they already had the web API running anyways and were knowledgeable about how to process their very own dumb files. Unfortunately, communications lead to nothing and I myself neither had the time nor the money to get something like this set up all by myself.


## Rising Hopes

In 2018 - two and a half years after stats.grok.se went down - some lucky events came together. First, I was leaving my current employment toying with the idea of doing freelance - so, suddenly I had a lot of time at my disposal. 
Second, Simon Munzert 
an R web scraping pioneer, political scientist and Professor at the Hertie
School of Governance was using Wikipedia page views for his 
research. Like me, he felt the need to get the data back online. 
And like me he he is a fan of open data for the public good. 
Most fortunate motivation, expertise and time were also met by money in form of Simon's research grant 
by the Mercedes and Benz Foundation. So, plans could be made, rents be payed, and children be fed. 


## Challenges

One of the big challenges was time, money and data quality. 

It wouldn't be fun if it was easy - right?

To give some perspective: Data from late 2007 up to late 2015 has roughly about 
3 trillion (3,183,334,099,176) data points for the 45 Million (45,008,117) pages of the 20 
languages covered (en, de, fr, es, it, cs, da, et, fi, el, hu, no, pl, pt, sk, sl, sv, tr, ru, zh).
Those 3 Trillion data points had to be aggregated from hourly counts to daily counts 
reducing the number of data points to 130 billion (132,638,920,799). 

My estimates were that a single machine with some cores would take several months to get all the processing steps done: data download, decompression, filtering, cleaning, transformation, aggregation, and storage.

In addition my personal goal was to be able to host the clean data aggregates 
on cheap standard servers - this implies that data should be well below one 
terabyte in size and databases queries should not take to much time to deliver a complete time series for a specific article in a specific language. 


## Solutions

Most of the space stems from the requested article names - 
long strings taking up loads of bytes. Furthermore, those labels were duplicated
due to the low aggregation level and the rawness of the data.
To solve for this size problem a choose to build up an dictionary of pages 
 available at certain points using data dumbs 
from [here](https://dumps.wikimedia.org/other/static_html_dumps/current/) and 
[here](https://dumps.wikimedia.org/other/pagetitles/). All page views 
that could not be found in the dictionary were simply excluded from the 
database. Time series values were referenced by dictionary id instead of 
using the large article labels. Tables were modeled to minimize data duplication.

To tackle the query time I optimized data storage for the standard use case: 
looking up a specific article for a specific language and requesting all available time series values. The labels in the dictionary got an index for fast lookups while time series data was stored in such a way that one row contains a whole month of page view values as comma separated value reducing the amount of rows to look up by factor 30. 

## Hurray

The result is a database with an REST API that once again allows to openly and 
free of charge get access to Wikipedia page view statistics for 2007 and up to 2016: http://petermeissner.de:8880/. For later dates [{wikipediatrend}](https://cran.r-project.org/web/packages/wikipediatrend/index.html) uses Wikipedia's own page views API. 

## Word of Caution

In regard to data quality some words of caution are appropriate: Data has been
gathered to allow for the highest possible quality but as real live data 
projects go there is always some bug waiting to bite you. One issue is article coverage. As reported above which articles to include and which not stems from the article lists used and their quality. This means e.g. that you will not get any data from articles that have not been there in 2008 or 2018. 




# Database API Endpoints

To allow for an public REST API a lightweight webserver works on top of the PostgreSQL database. The API has several endpoints that serve data in JSON format: 

## Endpoints

- API **description** can be found at `http://petermeissner.de:8880/`
- **article stats** will return page view stats for the specified article title given that its part of the database: `http://petermeissner.de:8880/article/exact/{lang}/{articlename}`
- **simple search and stats** will do a simple string matching search and return the first 100 title matches as well their times series data:   `http://petermeissner.de:8880/article/search/{lang}/{articlename}`
- **regex search without stats** will do a regular expression search but only return title matches and no page view numbers: `http://petermeissner.de:8880/search/{lang}/{regex}`




# The Release

With this release [{wikipediatrend}](https://cran.r-project.org/web/packages/wikipediatrend/index.html) once again has access to data from late 2007 
onwards by wrapping the self hosted API described above and the official Wikipedia [{pageviews}](https://cran.r-project.org/web/packages/pageviews/index.html) package. 

Although, package API (how functions are used and what they return)
has stayed the same, I decided to celebrate this big release with a major version bump from 1.x.x to 2.x.x.

One new function has been added to wrap the search API endpoint:  `wpd_search()` allows to search for page titles via regular 
expressions within the database. 

In addition several attempts have been made to improve the overall robustness, especially against missing data.




















