#' Monad Operators and Generics
#'
#' Classes implementing methods for these S7 generics are called monads.
#' `fmap()` should be implemented such that the \link[=functor-laws]{functor
#' laws} hold. `bind()` or `join()` should be implemented such that the
#' \link[=monad-laws]{monad laws} hold. `%>>%` is the `fmap()` pipe operator,
#' and `%>-%` is the `bind()` pipe operator. Operator usage is in the form `m
#' %>>% f(...)`.
#'
#' @section Details:
#'
#'   Monads are containers for values. `fmap()` transforms the contained value
#'   with a function. `bind()` transforms the contained value with a function
#'   that returns a monadic object. `join()` takes a monad whose contained value
#'   is another monad, and combines them into a new monadic object. It's used to
#'   unwrap a layer of monadic structure. Implementing classes typically embed
#'   some form of control flow or state management in `bind()` or `join()`.
#'
#'   There's a default implementation for `join()` if you provide `bind()`, and
#'   there's a default implementation for `bind()` if you provide `join()` and
#'   `fmap()`. For performance reasons you may wish to implement both
#'   regardless.
#'
#' @section Operators:
#'
#'   The pipe operators expect a monadic object as `lhs` and a function or a
#'   call expression as `rhs`. A call in `rhs` is treated as partial application
#'   of the function `f`. The pipe expression is transformed into a call to the
#'   corresponding monad generic with any call arguments in `rhs` passed as
#'   additional arguments to `f` in the generic. For example, `m %>>% f(x)` is
#'   equivalent to `fmap(m, f, x)` and `m %>-% f(x)` is equivalent to `bind(m,
#'   f, x)`.
#'
#' @section Trivia:
#'
#'   A class that only implements `fmap()` is called a functor.
#'
#' @param m,lhs A monadic object.
#' @param f,rhs A function. For `bind()`, it should return a monadic object.
#' @param ... Additional arguments passed to `f`.
#'
#' @returns A monadic object.
#' @seealso The \link[=monad-laws]{monad laws} and \link[=functor-laws]{functor
#'   laws} that implementations should satisfy.
#' @seealso [list] and [maybe] for examples of implementing classes.
#'
#' @name monad
NULL

#' @include pipeop.R

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

#' Functor Laws
#'
#' Classes implementing [fmap()] are expected to satisfy two functor laws:
#' preservation of identity and preservation of composition.
#'
#' The Haskell functor laws can be translated into R as follows:
#'
#' \describe{
#'  \item{Preservation of identity:}{`m %>>% identity` is equal to `m |> identity()`.}
#'  \item{Preservation of composition:}{`m %>>% (f %.% g)` is equal to `m %>>% g %>>% f`.}
#' }
#'
#' Where above `%.%` denotes function composition `\(f, g) \(x) f(g(x))`.
#'
#' @param m A functor object.
#' @param f,g Functions.
#'
#' @references <https://wiki.haskell.org/Functor#Functor_Laws>
#'
#' @family implementation laws
#' @name functor-laws
NULL

#' Monad Laws
#'
#' Classes implementing [bind()] are expected to satisfy three monad laws: left
#' identity, right identity, and associativity.
#'
#' The Haskell monad laws can be translated into R as follows:
#'
#' \describe{
#'  \item{Left identity:}{`pure(a) %>-% h` is equal to `h(a)`.}
#'  \item{Right identity:}{`m %>-% pure` is equal to `m`.}
#'  \item{Associativity:}{`(m %>-% g) %>-% h` is equal to `m %>-% \(x) g(x) %>-% h`.}
#' }
#'
#' @param pure The function to wrap a value in the monad.
#' @param h,g Monadic functions. Functions that return monadic objects.
#' @param a Any object.
#' @param m A monadic object.
#'
#' @references <https://wiki.haskell.org/Monad_laws>
#'
#' @family implementation laws
#' @name monad-laws
NULL
