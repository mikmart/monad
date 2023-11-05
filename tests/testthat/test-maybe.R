test_that("monad laws are satisfied", {
  h <- function(x) maybe::just(x / 2)
  g <- function(x) maybe::just(x + 2)

  expect_holds_left_identity(maybe::just, h, 1)
  expect_holds_left_identity(maybe::just, h, NULL)

  expect_holds_right_identity(maybe::just, maybe::just(1))
  expect_holds_right_identity(maybe::just, maybe::nothing())

  expect_holds_associativity(h, g, maybe::just(1))
  expect_holds_associativity(h, g, maybe::nothing())
})

test_that("functor laws are satisfied", {
  f <- function(x) x / 2
  g <- function(x) x + 2

  expect_holds_preserve_identity(maybe::just(1))
  expect_holds_preserve_identity(maybe::nothing())

  expect_holds_preserve_composition(f, g, maybe::just(1))
  expect_holds_preserve_composition(f, g, maybe::nothing())
})
