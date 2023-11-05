test_that("monad laws are satisfied", {
  # https://wiki.haskell.org/Monad_laws
  h <- function(x) maybe::just(x / 2)
  g <- function(x) maybe::just(x + 2)

  expect_left_identity(maybe::just, h, 1)
  expect_left_identity(maybe::just, h, NULL)

  expect_right_identity(maybe::just, maybe::just(1))
  expect_right_identity(maybe::just, maybe::nothing())

  expect_associativity(h, g, maybe::just(1))
  expect_associativity(h, g, maybe::nothing())
})
