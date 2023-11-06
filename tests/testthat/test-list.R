test_that("monad laws are satisfied", {
  h <- function(x) list(x / 2, x * 2)
  g <- function(x) list(x + 2, x - 2)

  expect_holds_left_identity(list, h, 1)
  expect_holds_left_identity(list, h, NULL)
  expect_holds_right_identity(list, list(1))
  expect_holds_associativity(h, g, list(1))
})

test_that("functor laws are satisfied", {
  f <- function(x) x / 2
  g <- function(x) x + 2

  expect_holds_preserve_identity(list(1))
  expect_holds_preserve_composition(f, g, list(1))
})
