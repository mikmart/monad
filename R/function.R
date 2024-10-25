#' The Function Monad
#'
#' The `function` built-in type is a functor with function composition as [fmap()].
#'
#' It's also possible to define [bind()] for Function in a way that satisfies
#' the [monad laws][monad-laws]: given the output of the first function with
#' some inputs, the second function returns the next function to apply to the
#' same inputs. And indeed that definition is provided, however its practical
#' uses may be limited.
#'
#' @family monads
#'
#' @examples
#' # The fmap operator corresponds to function composition.
#' p1log <- identity %>>% `+`(1) %>>% log()
#' p1log(0.5) == log1p(0.5)
#' @name Function
NULL

#' @include monad.R

method(fmap, class_function) <- function(m, f, ...) {
  g <- partialr(f, ...)
  function(...) g(m(...))
}

method(bind, class_function) <- function(m, f, ...) {
  g <- partialr(f, ...)
  function(...) g(m(...))(...)
}
