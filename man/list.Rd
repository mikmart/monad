% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/list.R
\name{list}
\alias{list}
\title{The List Monad}
\description{
The built-in \code{list} type is a monad with element-wise function application
as \code{\link[=fmap]{fmap()}} and flattening as \code{\link[=join]{join()}}. It follows that \code{\link[=fmap]{fmap()}} is a map
operator and \code{\link[=bind]{bind()}} is a "flat map" operator.
}
\examples{
\dontshow{if (requireNamespace("purrr", quietly = TRUE)) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# The fmap operator corresponds to purrr::map().
list(1, 2) \%>>\% `+`(1)

# The bind operator is a "flat-map".
list(1, 2) \%>-\% \(x) list(x * 2, x / 2)
\dontshow{\}) # examplesIf}
}
\seealso{
\code{\link[purrr:map]{purrr::map()}} which implements \code{\link[=fmap]{fmap()}} for \code{list}

\code{\link[purrr:list_flatten]{purrr::list_flatten()}} which implements \code{\link[=join]{join()}} for \code{list}.

Other monads: 
\code{\link{maybe}}
}
\concept{monads}
