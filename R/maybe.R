#' The Maybe Monad
#'
#' The [maybe](https://armcn.github.io/maybe/) package implements the Maybe
#' monad. It represents the explicit possiblity of absence of a value.
#' Methods for [fmap()], [bind()] and [join()] are provided for the `maybe`
#' S3 class as wrappers to functions in the package.
#'
#' @seealso [maybe::maybe_map()] which implements [fmap()] for `maybe`.
#' @seealso [maybe::and_then()] which implements [bind()] for `maybe`.
#' @family monads
#'
#' @examplesIf requireNamespace("maybe", quietly = TRUE)
#' # The fmap operator corresponds to maybe::maybe_map().
#' maybe::just(1) %>>% `+`(1)
#' maybe::nothing() %>>% `+`(1)
#'
#' # The bind operator corresponds to maybe::and_then().
#' maybe::just(1) %>-% \(x) maybe::just(x + 1)
#' maybe::just(1) %>-% \(x) maybe::nothing()
#' maybe::nothing() %>-% \(x) maybe::just(1)
#' @name Maybe
NULL

#' @include monad.R

class_maybe <- new_S3_class("maybe")

method(fmap, class_maybe) <- function(m, f, ...) {
  check_installed("maybe")
  maybe::maybe_map(m, \(x) f(x, ...))
}

method(bind, class_maybe) <- function(m, f, ...) {
  check_installed("maybe")
  maybe::and_then(m, \(x) f(x, ...))
}

method(join, class_maybe) <- function(m) {
  check_installed("maybe")
  maybe::maybe_flatten(m)
}
