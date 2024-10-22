test_that("pipe call construction works", {
  expect_equal(pipecallq(fmap, m %>>% f()), fmap(m, f) |> quote())
  expect_equal(pipecallq(bind, m %>-% f()), bind(m, f) |> quote())
})

test_that("additional arguments are treated as partial application", {
  expect_equal(pipecallq(fmap, m %>>% f(x, y)), fmap(m, monad:::partialr(f, x, y)) |> quote())
})

test_that("lhs of a pipe call can be NULL", {
  expect_equal(pipecallq(fmap, NULL %>>% f()), fmap(NULL, f) |> quote())
})

test_that("anonymous functions in rhs behave as expected", {
  expect_equal(pipecallq(fmap, m %>>% \(x) x + 1), fmap(m, \(x) x + 1) |> quote())
})

test_that("rhs can be a parenthesized anonymous function", {
  expect_equal(pipecallq(fmap, m %>>% (\(x) x + 1)), fmap(m, (\(x) x + 1)) |> quote())
})

test_that("can create custom pipe operators", {
  `%?>%` <- pipeop(\(x, f, ...) if (is.null(x)) x else f(x, ...))
  strscan <- \(x, sep, i = 1L) sapply(strsplit(x, sep), `[`, i)
  expect_equal(NULL %?>% strscan(""), NULL)
  expect_equal("42" %?>% strscan(""), "4")
  expect_equal("42" %?>% \(x) strsplit(x, "")[[1]], c("4", "2"))
})

test_that("arguments in RHS are not matched to pipe function", {
  expect_equal(
    pipecallq(fmap, m %>>% f(m = 1)) |> match.call(fmap, call = _),
    fmap(m = m, f = monad:::partialr(f, m = 1)) |> quote()
  )
})
