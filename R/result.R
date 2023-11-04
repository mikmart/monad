#' The Result Monad
#'
#' The Result monad represents the possibility of failure.
#'
#' @param value An object.
#'
#' @name result
#' @include monad.R
NULL

result <- new_class("result", abstract = TRUE)

#' @rdname maybe
#' @export
ok <- new_class("ok", result,
  properties = list(value = class_any),
  constructor = function(value) {
    new_object(S7_object(), value = value)
  }
)

#' @rdname maybe
#' @export
err <- new_class("err", result,
  properties = list(value = class_any),
  constructor = function(value) {
    new_object(S7_object(), value = value)
  }
)

method(fmap, ok) <- function(m, f, ...) ok(f(m@value, ...))
method(fmap, err) <- function(m, f, ...) m

method(bind, ok) <- function(m, f, ...) f(m@value, ...)
method(bind, err) <- function(m, f, ...) m
