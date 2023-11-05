
# monad

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

monad is an experiment to provide generic operators for monadic classes with S7.
The package provides:

* `fmap()`, `bind()` and `join()` S7 generic functions.
* `%>>%` and `%>-%` pipe operators for `fmap()` and `bind()` respectively.
* [testthat](https://testthat.r-lib.org/) expectations for functor and monad laws.
* Implementations of the generics for the [maybe](https://armcn.github.io/maybe/) package.

Implementing classes must provide `fmap()` and either `bind()` or `join()`, and
the method implementations must satisfy the functor and monad laws.

## Installation

Install from GitHub with:

``` r
pak::pak("mikmart/monad")
```
