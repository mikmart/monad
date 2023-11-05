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
#' Where above `%.%` denotes function composition.
#'
#' @param m A functor object.
#' @param f,g Functions.
#'
#' @references <https://wiki.haskell.org/Functor#Functor_Laws>
#'
#' @family implementation laws
#' @name functor-laws
NULL
