
# monad

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/mikmart/monad/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mikmart/monad/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The monad package provides generics and generic operators for monadic classes. These are:

* `fmap()`, `bind()` and `join()` [S7](https://rconsortium.github.io/S7/) generic functions.
* `%>>%` and `%>-%` pipe operators for `fmap()` and `bind()` respectively.

Implementations of the generics are provided for:

* The `list` built-in type via [purrr](https://purrr.tidyverse.org/). See `?monad::list`.
* The `maybe` S3 class from [maybe](https://armcn.github.io/maybe/). See `?monad::maybe`.

Implementing classes must provide `fmap()` and either `bind()` or `join()`.
Method implementations must satisfy the `?"functor-laws"` and `?"monad-laws"`.

The concepts are modelled directly after the [Monad typeclass](https://wiki.haskell.org/Monad)
in the functional programming language [Haskell](https://www.haskell.org/).
Operator names and calling conventions have been adapted to fit R.

## Installation

Install from [GitHub](https://github.com/mikmart/monad) with:

``` r
# install.packages("pak")
pak::pak("mikmart/monad")
```
