#' Functor Laws
#'
#' Classes implementing [fmap()] are expected to satisfy two functor laws.
#' Functions to test if the laws hold are provided for use with the `testthat`
#' package.
#'
#' The Haskell functor laws have been translated to R in the expectations as
#' follows:
#'
#' \describe{
#'  \item{Preservation of identity:}{`m %>>% identity` is equal to `m |> identity()`.}
#'  \item{Preservation of composition:}{`m %>>% (f %.% g)` is equal to `m %>>% g %>>% f`.}
#' }
#'
#' Where above `%.%` denotes function composition.
#'
#' @param m A functor object.
#' @param f,g Functions.
#'
#' @references <https://wiki.haskell.org/Functor#Functor_Laws>
#'
#' @family implementation laws
#' @name functor-laws
NULL

#' @rdname functor-laws
#' @export
expect_preserve_identity <- function(m) {
  rlang::check_installed("testthat")
  testthat::expect_equal(m %>>% identity, m |> identity())
}

#' @rdname functor-laws
#' @export
expect_preserve_composition <- function(f, g, m) {
  rlang::check_installed("testthat")
  testthat::expect_equal(m %>>% (f %.% g), m %>>% g %>>% f)
}

`%.%` <- function(f, g) function(...) f(g(...))
