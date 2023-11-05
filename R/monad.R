#' Monad Operators and Generics
#'
#' Classes implementing methods for these S7 generics are called monads. `%>>%`
#' is the `fmap()` pipe operator, and `%>-%` is the `bind()` pipe operator.
#' Operator usage is in the form `m %>>% f(...)`.
#'
#' @section Details:
#'
#'   Monads are containers for values. `fmap()` transforms the contained value
#'   with a function. `bind()` transforms the contained value with a function
#'   that returns a monadic object. `join()` takes a monad whose contained value
#'   is another monad, and combines them into a new monadic object. It is used
#'   to unwrap a layer of monadic structure. Implementing classes typically
#'   embed some form of control flow or state management in `bind()` or
#'   `join()`.
#'
#'   There is a default implementation for `join()` if you provide `bind()`, and
#'   a default implementation for `bind()` if you provide `join()` and `fmap()`.
#'   For performance reasons you may wish to implement both regardless.
#'
#' @section Operators:
#'
#'   The pipe operators expect a monadic object as `lhs` and a call expression
#'   or anonymous function as `rhs`. The pipe expression is transformed into a
#'   call to the corresponding monad generic with arguments to the call in `rhs`
#'   passed as additional arguments `...` to `f` in the generic. For example, `m
#'   %>>% f(x)` is equivalent to `fmap(m, f, x)` and `m %>-% f(x)` is equivalent
#'   to `bind(m, f, x)`.
#'
#' @section Trivia:
#'
#'   A class that only implements `fmap()` is called a functor.
#'
#' @param m,lhs A monadic object.
#' @param f,rhs A function. For `bind()`, it should return a monadic object.
#' @param ... Additional arguments passed to `f`.
#'
#' @name monad
NULL

#' @include pipeop.R
#' @import S7

#' @rdname monad
#' @export
`%>>%` <- pipeop(monad::fmap)

#' @rdname monad
#' @export
`%>-%` <- pipeop(monad::bind)

#' @rdname monad
#' @export
fmap <- new_generic("fmap", "m", function(m, f, ...) S7_dispatch())

#' @rdname monad
#' @export
bind <- new_generic("bind", "m", function(m, f, ...) S7_dispatch())
method(bind, class_any) <- function(m, f, ...) join(fmap(m, f, ...))

#' @rdname monad
#' @export
join <- new_generic("join", "m", function(m) S7_dispatch())
method(join, class_any) <- function(m) bind(m, identity)
