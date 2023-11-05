test_that("pipe call construction works", {
  expect_equal(pipecallq(fmap, m %>>% f(x)), fmap(m, f, x) |> quote())
  expect_equal(pipecallq(bind, m %>-% f(x)), bind(m, f, x) |> quote())
})

test_that("lhs of a pipe call can be NULL", {
  expect_equal(pipecallq(fmap, NULL %>>% f(x)), fmap(NULL, f, x) |> quote())
})

test_that("anonymous functions in rhs behave as expected", {
  expect_equal(pipecallq(fmap, m %>>% \(x) x + 1), fmap(m, \(x) x + 1) |> quote())
})

test_that("can create custom pipe operators", {
  `%?>%` <- pipeop(\(x, f, ...) if (is.null(x)) x else f(x, ...))
  strscan <- \(x, sep, i = 1L) sapply(strsplit(x, sep), `[`, i)
  expect_equal(NULL %?>% strscan(""), NULL)
  expect_equal("42" %?>% strscan(""), "4")
  expect_equal("42" %?>% \(x) strsplit(x, "")[[1]], c("4", "2"))
})

# FIXME: pipecallq(fmap, m %>>% f(m = 1)) |> match.call(fmap, call = _)
# The problem is the extra args in `...`. Can we just.. not?

# TODO: Treat calls in RHS as partial application.
