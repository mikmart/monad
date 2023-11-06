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
