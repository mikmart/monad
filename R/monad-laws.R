#' Monad Laws
#'
#' Classes implementing [bind()] or [join()] are expected to satisfy three monad
#' laws. Functions to test if the laws hold are provided for use with the
#' `testthat` package.
#'
#' The Haskell monad laws have been translated to R in the expectations as
#' follows:
#'
#' \describe{
#'  \item{Left identity:}{`pure(a) %>-% h` is equal to `h(a)`.}
#'  \item{Right identity:}{`m %>-% pure` is equal to `m`.}
#'  \item{Associativity:}{`(m %>-% g) %>-% h` is equal to `m %>-% \(x) g(x) %>-% h`.}
#' }
#'
#' @param pure The function to wrap a value in the monad.
#' @param h,g Functions that return monadic objects.
#' @param a Any object.
#' @param m A monadic object.
#'
#' @references <https://wiki.haskell.org/Monad_laws>
#'
#' @family implementation laws
#' @name monad-laws
NULL

#' @rdname monad-laws
#' @export
expect_left_identity <- function(pure, h, a) {
  rlang::check_installed("testthat")
  testthat::expect_equal(pure(a) %>-% h, h(a))
}

#' @rdname monad-laws
#' @export
expect_right_identity <- function(pure, m) {
  rlang::check_installed("testthat")
  testthat::expect_equal(m %>-% pure, m)
}

#' @rdname monad-laws
#' @export
expect_associativity <- function(h, g, m) {
  rlang::check_installed("testthat")
  testthat::expect_equal((m %>-% g) %>-% h, m %>-% \(x) g(x) %>-% h)
}