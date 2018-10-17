# The pol345.student package

`pol345.student` allows students to unpack and complete questions
in the pre-precept handouts for Princeton University's course 
Politics 345 (as run by Marc Ratkovic and Will Lowe in Fall 2018).

## Installation

The problem sets are a bit too big for CRAN, so you'll want to
make sure you've got the `devtools` package installed.  Then grab
the package from GitHub like this:

    devtools::install_github("conjugateprior/pol345.student")

## Updates

Experimentally, the package can be updated while installed by calling 

    update_package()
    
In case help caches get confused, restarting the R session may be required.

## Notes

* This package contains all the questions, all the data, but none of the
  answers!
* Eventually we'll be replaced by a `learnr` based setup.  In the meantime,
  we're in regular `Rmd`.

[![Travis-CI Build Status](https://travis-ci.org/conjugateprior/pol345.student.svg?branch=master)](https://travis-ci.org/conjugateprior/pol345.student)
