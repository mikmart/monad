#' The Maybe Monad
#'
#' The package [maybe](https://armcn.github.io/maybe/) implements the Maybe
#' monad. Here method implementations for [fmap()], [bind()] and [join()]
#' are provided for the `maybe` S3 class from the package. The methods are
#' simple wrappers for the corresponding functions in maybe.
#'
#' @seealso [maybe::maybe_map()] which implements [fmap()] for `maybe` values.
#' @seealso [maybe::and_then()] which implements [bind()] for `maybe` values.
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
#' @include monad.R
#' @name maybe
NULL

class_maybe <- new_S3_class("maybe")

method(fmap, class_maybe) <- function(m, f, ...) {
  check_installed("maybe")
  maybe::maybe_map(m, f, ...)
}

method(bind, class_maybe) <- function(m, f, ...) {
  check_installed("maybe")
  maybe::and_then(m, f, ...)
}

method(join, class_maybe) <- function(m) {
  check_installed("maybe")
  maybe::maybe_flatten(m)
}
