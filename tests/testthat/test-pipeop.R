test_that("pipe call construction works", {
  expect_equal(pipecallq(fmap, m %>>% f(x)), quote(fmap(m, f, x)))
  expect_equal(pipecallq(bind, m %>-% f(x)), quote(bind(m, f, x)))
})

test_that("lhs of a pipe call can be NULL", {
  expect_equal(pipecallq(fmap, NULL %>>% f(x)), quote(fmap(NULL, f, x)))
})

test_that("pipe operators throw useful errors for incorrect usage", {
  m <- f <- NULL # Avoid undefined variable checks.
  expect_snapshot(error = TRUE, m %>>% f)
  expect_snapshot(error = TRUE, m %>-% f)
})

test_that("can create custom pipe operators", {
  map_nullable <- function(x, f, ...) if (is.null(x)) x else f(x, ...)
  `%?>%` <- pipeop(map_nullable)
  expect_equal(NULL %?>% strsplit(""), NULL)
  expect_equal("42" %?>% strsplit(""), list(c("4", "2")))
  expect_equal(NULL %?>% function(x) strsplit(x, "")[[1]], NULL)
  expect_equal("42" %?>% function(x) strsplit(x, "")[[1]], c("4", "2"))
})
