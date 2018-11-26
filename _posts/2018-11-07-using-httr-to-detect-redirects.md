---
title: "Using httr to Detect HTTP(s) Redirects"
date: 2018-11-07
categories: blog
tags:
    - rstats
    - webscraping
    - robotstxt
    - httr
---



# The Summary

In this short note I will write about the [httr](https://cran.r-project.org/package=httr) package and my need to detect 
whether or not an HTTP request had been redirected or not - it turns out this is quite easy. Along the way I will also show how to access information of an HTTP-conversation other than the actual content to be retrieved. 



# The Problem

I am the creator and maintainer of the [robotstxt](https://cran.r-project.org/package=robotstxt) package an R package that enables users to retrieve and parse robots.txt files and ultimately is designed to do access permission checking for web resources. 

Recently a [discussion](https://github.com/ropensci/robotstxt/issues/27) came up about how to interpret permissions in case of sub-domains and HTTP redirects. Long story short: In case of robots.txt files redirects are suspicious and users should at least be informed about it happening so they might take appropriate action. 

So, I set out to find a way to check whether or not a robots.txt files requested via the httr package has gone through one or more redirects prior to its retrieval. 

[httr's](https://cran.r-project.org/package=httr)  automatic handling of redirects is one of its many wonderful features and happens silently in the background. Despite the fact that [httr](https://cran.r-project.org/package=httr) hides this process it turns out that the location negotiation process is transparently logged within the return value of httr's HTTP functions (e.g. `httr::GET()`). Furthermore it is easy to tap into that information for further processing. 



# The Request

Now let's get our hands dirty with some real HTTP-requests done via [httr](https://cran.r-project.org/package=httr). For this we use [httpbin.org](https://httpbin.org) a service allowing to test numerous HTTP-interaction scenarios - e.g. simple HTTP GET requests with redirection. 

When executing an HTTP GET request against the [httpbin.org/redirect/2](httpbin.org/redirect/2) endpoint it leads to two redirects before finally providing a resource. At first glance the result and status code looks pretty normal ...


```r
# executing HTTP request
r <- httr::GET("httpbin.org/redirect/2")
```

*... the status is 200 (everything OK)...*


```r
# HTTP status code
r$status_code
```

```
## [1] 200
```


*... and we get some content back.*


```r
# parsed content retrieved
httr::content(r)
```

```
## $args
## named list()
## 
## $headers
## $headers$Accept
## [1] "application/json, text/xml, application/xml, */*"
## 
## $headers$`Accept-Encoding`
## [1] "gzip, deflate"
## 
## $headers$Connection
## [1] "close"
## 
## $headers$Host
## [1] "httpbin.org"
## 
## $headers$`User-Agent`
## [1] "libcurl/7.59.0 r-curl/3.2 httr/1.3.1"
## 
## 
## $origin
## [1] "91.249.21.24"
## 
## $url
## [1] "http://httpbin.org/get"
```


# The Solution

So far, so good. If we look further into the response object we see that among its items there are two of particular interest: `headers` and `all_headers`. While the former only gives back headers and response meta information about the last response, the latter is a list of headers and response information for all responses. 



```r
# items of response object
names(r)
```

```
##  [1] "url"         "status_code" "headers"     "all_headers" "cookies"    
##  [6] "content"     "date"        "times"       "request"     "handle"
```

```r
# contents of all_headers item
names(r$all_headers[[1]])
```

```
## [1] "status"  "version" "headers"
```


The solution to the initial problem now can be written down as neat little function which (1) extracts all status codes logged in `all_headers` and (2) checks if any of them equals some [`3xx`](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#3xx_Redirection) status code (3xx is mainly but not exclusively about redirection but can be considered always suspicious in the problem at hand).



```r
#' http_was_redirected
#'
#' @param response an httr response object, e.g. from a call to httr::GET()
#'
#' @return logical of length 1 indicating whether or not any redirect happened 
#'   during the HTTP request
#'
#' @export
#'
http_was_redirected <- 
  function(response){
    # extract status 
    status <- 
      vapply(
        X         = response$all_headers, 
        FUN       = `[[`, 
        FUN.VALUE = integer(1),
        "status"
      )
    
    # check status and return
    any(status >= 300 & status < 400)
  }
```












# The Bonus

A more specific question in regard to redirects is whether or not a redirect 
did not only change the path but also entailed a domain change - robots.txt conventions clearly state that each domain and subdomain have to provide their own robots.txt files.


The following function makes use of the `all_headers` item from the response object again. In addition it uses the `domain()` function provided by the [urltools](https://cran.r-project.org/package=urltools) package to extract the domain part of an [URL](https://en.wikipedia.org/wiki/URL). If any location header shows a domain not equal to that of the original URL requested a domain change must have happened along the way. 


```r
#' http_domain_changed
#'
#' @param response an httr response object, e.g. from a call to httr::GET()
#'
#' @return logical of length 1 indicating whether or not any domain change 
#'     happened during the HTTP request
#'
#' @export
#'
http_domain_changed <- 
  function(response){
    # get domain of origignal HTTP request
    orig_domain <- urltools::domain(response$request$url)
    
    # extract location headers
    location <- 
      unlist(
        lapply(
          X   = response$all_headers, 
          FUN = 
            function(x){
              x$headers$location
            }
        )
      )
    
    # new domains
    new_domains <- urltools::domain(location)
    
    # check domains in location against original domain
    any( !is.na(new_domains) & new_domains != orig_domain )
  }
```



# Some Resources

- [https://cran.r-project.org/package=httr](https://cran.r-project.org/package=httr)
- [https://cran.r-project.org/package=robotstxt](https://cran.r-project.org/package=robotstxt)
- [https://cran.r-project.org/package=urltools](https://cran.r-project.org/package=urltools)
- [https://developers.google.com/search/reference/robots_txt?hl=en](https://developers.google.com/search/reference/robots_txt?hl=en)
- [https://en.wikipedia.org/wiki/Robots_exclusion_standard](https://en.wikipedia.org/wiki/Robots_exclusion_standard)
- [https://www.webnots.com/what-is-http/](https://www.webnots.com/what-is-http/)
- [https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages](https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages)
- [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections)
