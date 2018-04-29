---
title: "Re-exporting the magrittr pipe operator"
date:  2018-04-27 18:00:00
categories: blog
tags:
    - rstats
    - package
---

... or how I stoped worrying and wrote a blog post to remember it ad infinitum. 

Magrittr's pipe operator is one of those newish R-universe features that I 
really want to have around whenever I put some lines into an R-console. 
This is even `TRUE` when writing a package. 

So the first thing I do is put *magrittr* into the *DESCRIPTION* file and add 
an *__imports.R* file to the packages *R/*-directory with the following lines:

```r
#' re-export magrittr pipe operator
#'
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @export
NULL
```

These lines import and re-export the pipe operator (`%>%`) therewith allowing to
use it within my package but also beeing able to use it interactively whenever
the package is loaded. 

Best of all these lines will also ensure passing all 
package checks (CRAN complient) and preventing any 
*"The following objects are masked from ..."* messages. 

Last but not least the file name *"__imports.R"* serves two purposes 
(1) making the it appear at the very beginning of an alphabetical sorted lists of 
file names and (2) second giving it a speaking name to inform - however 
reads the file name - that some R "Imports" are most likely happening inside. 

Happy coding!

PS.: Those lines above require the usage of `roxygen2` as documentation framework. 
