#' @title Roll a die
#' @description Creates an object of class \code{"roll"}
#' @param die object of class \code{"die"}
#' @param times number of rolls
#' @return an object of class \code{"roll"} with the following elements:
#' @return \item{rolls}{vector of rolls}
#' @return \item{sides}{vector of die \code{"sides"}}
#' @return \item{prob}{vector of die \code{"prob"}}
#' @return \item{total}{total number of rolls}
#' @export
#' @examples
#' # roll fair die 50 times
#' fair_die <- die()
#' set.seed(123)
#' fair50 <- roll(fair_die, times = 50)
#'
#' # string die
#' str_die <- die(
#'  sides = c('a', 'b', 'c', 'd', 'e', 'f'),
#'  prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
#'
#' # roll 20 times
#' set.seed(123)
#' str_rolls <- roll(str_die, times = 20)
#'
#' set.seed(123)
#' fair_50rolls <- roll(fair_die, times = 50)
#' fair50_sum <- summary(fair_50rolls)
#'
#' # roll fair die
#' set.seed(123)
#' fair_die <- die()
#' fair500 <- roll(fair_die, times = 500)
#'
#' # summary method
#' summary(fair500)
#'
#' # extracting roll in position 500
#' fair500[500]
#'
#' # replacing last roll
#' fair500[500] <- 1
#' fair500[500]
#'
#' summary(fair500)
#'
#' # adding 100 rolls
#' fair600 <- fair500 + 100
#' summary(fair600)
roll <- function(die, times = 1) {
  check_times(times)
  tosses <- toss(die, times = times)
  make_roll(die, tosses)
}


# private function to check vector of 'times'
check_times <- function(times) {
  if (!is.numeric(times)) {
    stop("\nnon-numeric argument to binary operator")
  } else if (times <= 0 | times %% 1 != 0) {
    stop("\nargument 'times' must be a positive integer")
  } else {
    TRUE
  }
}


# private function
toss <- function(x, times = 1) {
  sample(x$sides, size = times, replace = TRUE, prob = x$prob)
}


#' @title Make Roll Object
#' @description Constructor function for object "roll"
#' @param die object of class die
#' @param tosses object of class tosses
#' @keywords internal
make_roll <- function(die, tosses) {
  res <- list(
    rolls = tosses,
    sides = die$sides,
    prob = die$prob,
    total = length(tosses))
  class(res) <- "roll"
  res
}



#' @export
print.roll <- function(x, ...) {
  cat('object "roll"\n\n$rolls\n')
  cat(x$rolls)
  invisible(x)
}


#' @export
summary.roll <- function(object, ...) {
  counts <- c(
    sum(object$rolls == object$sides[1]),
    sum(object$rolls == object$sides[2]),
    sum(object$rolls == object$sides[3]),
    sum(object$rolls == object$sides[4]),
    sum(object$rolls == object$sides[5]),
    sum(object$rolls == object$sides[6])
  )
  proportions <- c(
    sum(object$rolls == object$sides[1]) / object$total,
    sum(object$rolls == object$sides[2]) / object$total,
    sum(object$rolls == object$sides[3]) / object$total,
    sum(object$rolls == object$sides[4]) / object$total,
    sum(object$rolls == object$sides[5]) / object$total,
    sum(object$rolls == object$sides[6]) / object$total
  )
  freqs <- data.frame(
    side = object$sides,
    count = counts,
    prop = proportions)
  obj <- list(freqs = freqs)
  class(obj) <- "summary.roll"
  obj
}


#' @export
print.summary.roll <- function(x, ...) {
  cat('summary "roll"\n\n')
  print(x$freqs)
  invisible(x)
}


#' @export
"[<-.roll" <- function(x, i, value) {
  if (value != x$sides[1] & value != x$sides[2] & value != x$sides[3] & value != x$sides[4] & value != x$sides[5] & value != x$sides[6]) {
    stop(sprintf('\nreplacing value must be %s, %s, %s, %s, %s, or %s', x$sides[1], x$sides[2], x$sides[3], x$sides[4], x$sides[5], x$sides[6]))
  }
  if (i > x$total) {
    stop("\nindex out of bounds")
  }
  x$rolls[i] <- value
  make_roll(x, x$rolls)
}


#' @export
"[.roll" <- function(x, i) {
  x$rolls[i]
}


#' @export
"+.roll" <- function(obj, incr) {
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increament")
  }
  more_tosses <- toss(obj, times = incr)
  make_roll(obj, c(obj$rolls, more_tosses))
}


#' @rdname roll
#' @param x an R object
#' @export
is.roll <- function(x) {
  inherits(x, "roll")
}


#' @rdname roll
#' @export
as.roll <- function(x) {
  x_die <- die(unique(x))
  make_roll(x_die, x)
}
