#' The Maybe Monad
#'
#' The Maybe monad represents the presence or absence of a value.
#'
#' @param value An object.
#'
#' @name maybe
#' @examples
#' # fmap() transforms the wrapped value, if there is one.
#' some(1) %>>% `+`(1)
#' none() %>>% `+`(1)
#'
#' # bind() should be used with functions that return a maybe.
#' some(1) %>-% function(x) none()
#' some(1) %>>% function(x) none() # Probably not what you wanted.
#' @include monad.R
NULL

maybe <- new_class("maybe", abstract = TRUE)

#' @rdname maybe
#' @export
some <- new_class("some", maybe,
  properties = list(value = class_any),
  constructor = function(value) {
    new_object(S7_object(), value = value)
  }
)

#' @rdname maybe
#' @export
none <- new_class("none", maybe)

method(fmap, some) <- function(m, f, ...) some(f(m@value, ...))
method(fmap, none) <- function(m, f, ...) none()

method(join, some) <- function(m) m@value
method(join, none) <- function(m) none()
