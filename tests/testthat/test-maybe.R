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

test_that("functor laws are satisfied", {
  # https://wiki.haskell.org/Functor#Functor_Laws
  f <- function(x) x / 2
  g <- function(x) x + 2

  expect_preserve_identity(maybe::just(1))
  expect_preserve_identity(maybe::nothing())

  expect_preserve_composition(f, g, maybe::just(1))
  expect_preserve_composition(f, g, maybe::nothing())
})
