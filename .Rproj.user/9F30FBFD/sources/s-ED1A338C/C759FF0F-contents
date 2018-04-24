#' @title Plot of object roll
#' @description Plots the relative frequencies of a series of rolls
#' @param x an object of class \code{"die"}
#' @param side number indicating which side of die to consider
#' @param \dots arguments to be passed to/from other methods
#' @export
#' @examples
#'  \dontrun{
#'  # create a die and roll it 50 times
#'  fair_die <- die()
#'  set.seed(123)
#'  fair_50rolls <- roll(fair_die, times = 50)
#'
#'  plot(fair_50rolls)
#'  }
plot.roll <- function(x, ...) {
  freqs <- frequencies(x)
  barplot(freqs, las = 1,
       xlab = "sides of die",
       ylab = sprintf("relative frequencies"),
       names.arg = c(1:6))
  title(sprintf("Frequencies in a series of %s die rolls", x$total))
}



# auxiliary function for plot.roll() method
frequencies <- function(x) {
  freqs_side_1 <- sum(x$rolls == x$sides[1]) / x$total
  freqs_side_2 <- sum(x$rolls == x$sides[2]) / x$total
  freqs_side_3 <- sum(x$rolls == x$sides[3]) / x$total
  freqs_side_4 <- sum(x$rolls == x$sides[4]) / x$total
  freqs_side_5 <- sum(x$rolls == x$sides[5]) / x$total
  freqs_side_6 <- sum(x$rolls == x$sides[6]) / x$total
  return(c(freqs_side_1, freqs_side_2, freqs_side_3, freqs_side_4, freqs_side_5, freqs_side_6))
}
