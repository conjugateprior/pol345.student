# The pol345.student package

`pol345.student` allows students to unpack and complete questions
in the pre-precept handouts for Princeton University's course 
Politics 345.  This updated package is designed for the Fall 2021
Semster and was originally developed by Will Lowe and Marc Ratkovic 
in Fall 2019.

## Installation

The problem sets are a bit too big for CRAN, so you'll want to
make sure you've got the `devtools` package installed.  Then grab
the package from GitHub like this:

    devtools::install_github("ratkovic/pol345.student")

## Updating

The package can be updated while installed by calling 

    update_package()
    
For good measure, now *restart* your R session. In RStudio use the menu: 
`Session > Restart R`.

## Usage

### Working on a handout

To start work on handout one, type
```
get_handout(1)
```
This will unpack the handout materials into a folder called
`handout1` in your *current working directory*.
(Type `getwd()` if you're not sure where that is. 
You can change it using `setwd` or through RStudio's 
Session menu).

If you want to *fresh start* on the same handout, you'll can unpack 
again under a different name (the `get_handout` function won't
overwrite an existing folder.) To do this add a 
`newname` argument when y ou call the function. So, if you want 
your new copy to be called "handout1-for-real", then use 
```
get_handout(1, newname = "handout1-for-real")
```
Provided there's not already a folder of that name in your 
current working directory, you'll get a fresh set of 
handout materials unpacked there.

If you want to preview the questions in a handout materials *without* 
unpacking it into your local file system, use
```
preview_handout(1)
```

### Working on a precept

Working on precept is just the same; just use
`get_precept(1)`, 
`get_precept(1, newname = "precept1-second-go")`, or 
`preview_precept(1)` as above.

### Sneak preview

You can view precept 1's 'answers' with
```{r}
get_precept_answers(1)
```
Note: this shows one way to answer the questions. Often 
there will be others, so do not automatically assume that 
your code is incorrect if it does not match the code in the 
answers.

## Status

[![Travis-CI Build Status](https://travis-ci.org/conjugateprior/pol345.student.svg?branch=master)](https://travis-ci.org/conjugateprior/pol345.student) [![Build status](https://ci.appveyor.com/api/projects/status/rfj426c7ddq4ni72?svg=true)](https://ci.appveyor.com/project/conjugateprior/pol345-student)
