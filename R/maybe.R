#' The Maybe Monad
#'
#' Package [maybe](https://armcn.github.io/maybe/) implements the Maybe monad.
#' Here method implementations are provided for the `maybe` S3 class from the
#' maybe package for the [fmap()], [bind()] and [join()] generics. The methods
#' are simple wrappers for the corresponding functions in maybe.
#'
#' @seealso [maybe::maybe_map()] which implements [fmap()] for Maybe values.
#' @seealso [maybe::and_then()] which implements [bind()] for Maybe values.
#'
#' @examplesIf rlang::is_installed("maybe")
#'
#' # The fmap operator corresponds to maybe::maybe_map().
#' maybe::just(1) %>>% `+`(1)
#' maybe::nothing() %>>% `+`(1)
#'
#' # The bind operator corresponds to maybe::and_then().
#' maybe::just(1) %>-% \(x) maybe::nothing()
#' maybe::nothing() %>-% \(x) maybe::just(1)
#' @include monad.R
#' @name maybe
NULL

class_maybe <- new_S3_class("maybe")

method(fmap, class_maybe) <- function(m, f, ...) {
  rlang::check_installed("maybe")
  maybe::maybe_map(m, f, ...)
}

method(bind, class_maybe) <- function(m, f, ...) {
  rlang::check_installed("maybe")
  maybe::and_then(m, f, ...)
}

method(join, class_maybe) <- function(m) {
  rlang::check_installed("maybe")
  maybe::maybe_flatten(m)
}
