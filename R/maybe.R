#' @include monad.R
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
