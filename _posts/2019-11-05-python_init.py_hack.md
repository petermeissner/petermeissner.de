---
title: "Python Multi File Modules"
date: 2019-11-05
categories: blog
tags:
    - python
    - hack
    - dirty
    - module
    - package
---


# The problem

The basic problem obviously is that I have a very distinct and opinionated
way to think about modules and Python's own opinion doesn't make it easy to 
get it done the way I think is best. 


# The use case

The use case is the following. Imagine working on a project. 
The project grows larger and larger and gets more complex. 
The need for packaging up some code arises when code has to be reused throughout 
the project. 

Solution? A module of cause. Python modules are easy - `import filename` will look for a file called `filename.py` and make its content available in a namespace called `filename`. 
Python modules are safe - all things within `filename.py` will be put into a new
namespace so nothing can overwrite thing already present. Easy - right?

How can you use your code now?

```python
# import
import filename

# function usage
filename.function_name()
```


Things get a little tricky when more and more functions and classes join the party.
So, you put all the code into a folder (lets call it `folder/` for the sake of 
the example) and add an `__init__.py` to the folder to mark it as a python package.

Now, your working directory looks clean again but your imports now got an 
additional layer of namespaces:



```python
# import
import folder.filename

# function usage
folder.filename.function_name()
```



After a while you realize that you now have more than 30 functions and classes.
Scrolling up and down the module file becomes cumbersome and irritating. 
You like the idea that your file system already gives you an idea about where 
to find what so you structure it like this: on thing, one file with the filename 
equaling the object name defined within the file. 

Your code now looks like this: 


```python
# import
import folder.function_name
import folder.function_name2
import folder.function_name3
import folder.function_name4
...


# function usage
folder.function_name.function_name()
folder.function_name2.function_name2()
folder.function_name3.function_name3()
folder.function_name4.function_name4()
...
```

... this is ugly and very tiresome!

So, you think and read and sit and brute and ask around and think and fail and fail and fail 
again and again and again until you finally come up with a solution consisting of three 
main ideas: 

1. Looping over imports: It turns out that there is a module and a function for this: `importlib` and its `import_module()` function. 
2. Freeing the objects from their redundant namespace enclosing - there is a function for this called `getattr()`
3. Assigning varying names to the things extracted within the loop. 


Cranking it all together the final solution looks like this - ready to be put into the 
afore mentioned `__init__.py`. 


```python
# imports
import importlib
import os
import glob

# get list of files 
module_files = glob.glob(os.path.join(os.path.dirname(__file__), "*.py"))


# loop over files
for mod in module_files:
  
  # valid python code file?
  if os.path.isfile(mod) and not mod.endswith('__init__.py'):
    
    # extract the module and object name
    mod_name = os.path.basename(os.path.splitext(mod)[0])
    obj_name = mod_name
    
    # import module
    mod = importlib.import_module(name = "folder." + mod_name)
    
    # extract object from module 
    globals()[obj_name] = getattr(mod, obj_name)
```

... or more general to import everything within a file ...


```python
import importlib
import os
import glob

# get list of files 
module_files = glob.glob(os.path.join(os.path.dirname(__file__), "*.py"))

# loop over all module files
for mod in module_files:
  
  # check if file is a real module and exists
  if os.path.isfile(mod) and not mod.endswith('__init__.py') and not os.path.basename(mod).startswith(("_", ".")):
    
    # extract module name from file name and import it
    mod_name = os.path.basename(os.path.splitext(mod)[0])
    mod = importlib.import_module(name = "ll." + mod_name)
    
    # loop over objects in module and import all of them 
    for object_name in filter(lambda x: not x.startswith("__"), dir(mod)):

      # assign object into current global 
      globals()[object_name] = getattr(mod, object_name)
```

From than on your code can look like this:


```python
# import
import folder


# function usage
folder.function_name()
folder.function_name2()
folder.function_name3()
folder.function_name4()
...
```

... much neater - right?


# Words of caution

I freely admit that this is a quite dirty hack and might have yet undiscovered consequences or side effects. But. At the moment I am really proud of this and will use it happily within non critical codebases since it really frees me of some cognintive and administrative burdens python's module system imposes otherwise.
