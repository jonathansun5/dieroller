context("Check roll arguments")

test_that("check_times with ok vectors", {

  expect_true(check_times(1))
  expect_true(check_times(5))
  expect_true(check_times(10000))
})


test_that("check_times fails with invalid lengths", {

  expect_error(check_times(1.2))
  expect_error(check_times(0))
  expect_error(check_times(1/3))
  expect_error(check_times(-1))
  expect_error(check_times(-0.5))
  expect_error(check_times(-2/3))
})


test_that("check_times fails with invalid types", {

  expect_error(check_times("5"), "\nnon-numeric argument to binary operator")
  expect_error(check_times(c("yayaya", "55555", "yo")), "\nnon-numeric argument to binary operator")
  expect_error(check_times("yayaya"), "\nnon-numeric argument to binary operator")
  expect_error(check_times(NA), "\nnon-numeric argument to binary operator")
  expect_error(check_times(-1), "\nargument 'times' must be a positive integer")
  expect_error(check_times(0), "\nargument 'times' must be a positive integer")
})
