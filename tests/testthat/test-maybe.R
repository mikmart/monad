test_that("constructors work", {
  expect_no_error(some(1))
  expect_no_error(none())
  expect_error(some())
  expect_error(none(1))
  expect_error(maybe())
})
