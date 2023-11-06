
# monad

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/mikmart/monad/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mikmart/monad/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

monad provides generic operators for monadic classes. Features include:

* `fmap()`, `bind()` and `join()` [S7](https://rconsortium.github.io/S7/) generic functions.
* `%>>%` and `%>-%` pipe operators for `fmap()` and `bind()` respectively.

Implementations of the generics are provided for:

* The `list` built-in type.
* The `maybe` S3 class from the [maybe](https://armcn.github.io/maybe/) package.

Implementing classes must provide `fmap()` and either `bind()` or `join()`, and
the method implementations must satisfy the functor and monad laws.

## Installation

Install from [GitHub](https://github.com/mikmart/monad) with:

``` r
# install.packages("pak")
pak::pak("mikmart/monad")
```
