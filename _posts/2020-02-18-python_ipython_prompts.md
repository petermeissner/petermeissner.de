---
title: "Tuning the IPython Terminal Prompts"
date: 2020-02-18
categories: blog
tags:
    - python
    - ipython
    - hack
---


# The problem

I like the IPython terminal for all its colors and syntax completion but what I really cannot stand is getting told all the time that this line is an input and the other one right after is an output. 

Why?<br>
Its an interactive terminal.<br>
I know that the one line is the input and the other line right after is the output. <br>
I just typed those lines in.

Enough ranting IPython has been around for some time now and would not have gotten its superp reputation and wide spread acceptance if there was not a tweak to be made. 


# The solution

Tweaking Ipython involves two pieces: 

1. Creating a config file.
2. Overwriting the default input and output prompts. 


Creating a config file is easy, we can ask IPython to do it for us. The follwing line will create a conig file within the users home directory [(IPython documentation)](https://ipython.readthedocs.io/en/stable/config/index.html#configuring-ipython):

`~/.ipython/profile_default/ipython_config.py`


```bash
ipython profile create
```

Editing the file we can add the follwing lines which will overwrite the default prompts [(see here for source)](https://stackoverflow.com/a/42157084/1144966): 

```python
from IPython.terminal.prompts import Prompts
from pygments.token import Token

class MyPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '')]
    def out_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '## ')]
```


This will change the IPython terminal output from the default and well known 
verboseness ... 

```ipython
In [1]: 1
Out[1]: 1

In [2]: 2
Out[2]: 2

In [3]:
```

... to a **more concise** and **copy and paste friendly format** that looks like this:


```ipython
1
## 1

2
## 2

3
## 3
```









