#' @title Die
#' @description Creates an object of class \code{"die"}
#' @param sides vector of die sides
#' @param prob vector of side probabilities
#' @return an object of class \code{"die"}
#' @seealso \code{\link{roll}}
#' @export
#' @examples
#' # default call: creates a standard fair die
#' fair_die <- die()
#' 
#' # die with non-standard sides
#' weird_die <- die(sides = c('i', 'ii', 'iii', 'iv', 'v', 'vi'))
#' 
#' # create a loaded die
#' loaded_die <- die(prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
#' 
die <- function(sides = c(1, 2, 3, 4, 5, 6), prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)) {
  check_sides(sides)
  check_prob(prob)

  object <- list(
    sides = sides,
    prob = prob)
  class(object) <- "die"
  object
}


# private function to check vector of sides
check_sides <- function(sides) {
  if (length(sides) != 6) {
    stop("\n'sides' must be a vector of length 6")
  } 
  if (!is.numeric(sides) & !is.character(sides)) {
    stop("\n'sides' must be a character or numeric vector")
  }
  TRUE
}


# private function to check vector of probabilities
check_prob <- function(prob) {
  if (length(prob) != 6 | !is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector of length 6")
  }
  if (any(is.na(prob))) {
    stop("\n'prob' cannot contain missing values")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }
  TRUE
}



#' @export
print.die <- function(x, ...) {
  cat('object "die"\n\n')
  dat <- data.frame("side" = x$sides, "prob" = x$prob)
  print(dat)
  invisible(x)
}


#' @rdname die
#' @param x an R object
#' @export
is.die <- function(x) {
  is(x, "die")
}
