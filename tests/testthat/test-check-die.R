context("Check die arguments")

test_that("check_sides with ok vectors", {

  expect_true(check_sides(c(1, 2, 3, 4, 5, 6)))
  expect_true(check_sides(c('a', 'b', 'c', 'd', 'e', 'f')))
  expect_true(check_sides(c('i', 'ii', 'iii', 'iv', 'v', 'vi')))
})


test_that("check_sides fails with invalid lengths", {

  expect_error(check_sides(c('one', 'two', 'three')))
  expect_error(check_sides(c('one')))
  expect_error(check_sides(1:5))
  expect_error(check_sides(1))
  expect_error(check_sides(c('i', 'ii', 'iii', 'iv', 'v')))
  expect_error(check_sides(c('a', 'b', 'c', 'd', 'e')))
})


test_that("check_sides fails with invalid types", {

  expect_error(check_sides(c('one', 'two', 'three')), "\n'sides' must be a vector of length 6")
  expect_error(check_sides(c('one')),
               "\n'sides' must be a vector of length 6")
})


test_that("check_prob works with ok vectors", {

  expect_true(check_prob(c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)))
  expect_true(check_prob(c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)))
})


test_that("check_prob fails with invalid lengths", {

  expect_error(check_prob(c(1:5)))
  expect_error(check_prob(c(1)))
  expect_error(check_prob(c(1/6, 1/6, 1/6, 1/6, 1/6)))
})


test_that("check_prob fails with invalid numbers", {

  expect_error(check_prob(c(0.2, 0.1, 0.1, 0.1, 0.5, 0.1)))
  expect_error(check_prob(c(-0.2, 0.1, -0.1, 0.1, -0.5, 0.1)))
  expect_error(check_prob(c(0, 0, 0, 0, 0, 0)))
  expect_error(check_prob(c(1, 1, 1, 1, 1, 1)))
  expect_error(check_prob(c(NA, NA, NA, NA, NA, NA)))
})
