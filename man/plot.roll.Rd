% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot-roll.R
\name{plot.roll}
\alias{plot.roll}
\title{Plot of object roll}
\usage{
\method{plot}{roll}(x, ...)
}
\arguments{
\item{x}{an object of class \code{"die"}}

\item{\dots}{arguments to be passed to/from other methods}
}
\description{
Plots the relative frequencies of a series of rolls
}
\examples{
 # create a die and roll it 50 times
 fair_die <- die()
 set.seed(123)
 fair_50rolls <- roll(fair_die, times = 50)

 plot(fair_50rolls)
}
