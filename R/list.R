#' The List Monad
#'
#' The `list` built-in type is a monad with element-wise function application
#' as [fmap()] and flattening as [join()]. It follows that `%>>%` is a map
#' operator and `%>-%` is a "flat map" operator. The methods are implemented
#' as wrappers to the [purrr](https://purrr.tidyverse.org/) package.
#'
#' @seealso [purrr::map()] which implements [fmap()] for `list`.
#' @seealso [purrr::list_flatten()] which implements [join()] for `list`.
#'
#' @examplesIf requireNamespace("purrr", quietly = TRUE)
#' # The fmap operator corresponds to purrr::map().
#' list(1, 2) %>>% `+`(1)
#'
#' # The bind operator is a "flat map" that combines output lists.
#' list(1, 2) %>-% \(x) list(x * 2, x / 2)
#' @include monad.R
#' @family monads
#' @name List
NULL

method(fmap, class_list) <- function(m, f, ...) {
  check_installed("purrr")
  purrr::map(m, \(x) f(x, ...))
}

method(join, class_list) <- function(m) {
  check_installed("purrr")
  purrr::list_flatten(m)
}
