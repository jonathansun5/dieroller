
<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

`"dieroller"` is a minimal [R](http://www.r-project.org/) package that provides functions to simulate rolling a die.

-   `die()` creates a die object (of class `"die"`)
-   `roll()` tosses a die object, producing a `"roll"` object.
-   `plot()` method for a `"roll"` object to plot frequencies of die rolls.
-   `summary()` method for a `"roll"` object.

Motivation
----------

This package has been developed to illustrate some of the concepts behind the creation of an R package.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "dieroller" (without vignettes)
devtools::install_github("jonathansun5/dieroller")

# install "dieroller" (with vignettes)
devtools::install_github("jonathansun5/dieroller", build_vignettes = TRUE)
```

Usage
-----

``` r
library(dieroller)

# default die
die1 <- die()
die1
#> object "die"
#> 
#>   side      prob
#> 1    1 0.1666667
#> 2    2 0.1666667
#> 3    3 0.1666667
#> 4    4 0.1666667
#> 5    5 0.1666667
#> 6    6 0.1666667

# 1 roll of die1
roll(die1)
#> object "roll"
#> 
#> $rolls
#> 6

# 10 rolls of die1
roll10 <- roll(die1, times = 10)
roll10
#> object "roll"
#> 
#> $rolls
#> 1 2 4 2 4 1 5 3 1 2

# summary
summary(roll10)
#> summary "roll"
#> 
#>   side count prop
#> 1    1     3  0.3
#> 2    2     3  0.3
#> 3    3     1  0.1
#> 4    4     2  0.2
#> 5    5     1  0.1
#> 6    6     0  0.0


# 100 rolls
roll100 <- roll(die1, times = 100)

# summary
summary(roll100)
#> summary "roll"
#> 
#>   side count prop
#> 1    1    17 0.17
#> 2    2    17 0.17
#> 3    3    19 0.19
#> 4    4    18 0.18
#> 5    5    11 0.11
#> 6    6    18 0.18
```
