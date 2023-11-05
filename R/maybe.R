#' @export
fmap.maybe <- function(m, f, ...) {
  maybe::maybe_map(m, f, ...)
}

#' @export
bind.maybe <- function(m, f, ...) {
  maybe::and_then(m, f, ...)
}

#' @export
join.maybe <- function(m) {
  maybe::maybe_flatten(m)
}
