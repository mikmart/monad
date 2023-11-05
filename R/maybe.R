#' @include monad.R
class_maybe <- new_S3_class("maybe")

#' @export
method(fmap, class_maybe) <- function(m, f, ...) {
  rlang::check_installed("maybe")
  maybe::maybe_map(m, f, ...)
}

#' @export
method(bind, class_maybe) <- function(m, f, ...) {
  rlang::check_installed("maybe")
  maybe::and_then(m, f, ...)
}

#' @export
method(join, class_maybe) <- function(m) {
  rlang::check_installed("maybe")
  maybe::maybe_flatten(m)
}
