test_that("fmap works as expected", {
  expect_equal(maybe::just(1) %>>% \(x) x + 1, maybe::just(2))
  expect_equal(maybe::nothing() %>>% \(x) x + 1, maybe::nothing())
})

test_that("bind works as expected", {
  expect_equal(maybe::just(1) %>-% \(x) maybe::just(2), maybe::just(2))
  expect_equal(maybe::nothing() %>-% \(x) maybe::just(2), maybe::nothing())
  expect_equal(maybe::just(1) %>-% \(x) maybe::nothing(), maybe::nothing())
  expect_equal(maybe::nothing() %>-% \(x) maybe::nothing(), maybe::nothing())
})

test_that("join works as expected", {
  expect_equal(maybe::just(maybe::just(1)) |> join(), maybe::just(1))
  expect_equal(maybe::just(maybe::nothing()) |> join(), maybe::nothing())
  expect_equal(maybe::nothing() |> join(), maybe::nothing())
})

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
