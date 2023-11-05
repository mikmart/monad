# https://wiki.haskell.org/Monad_laws
expect_holds_left_identity <- function(pure, h, a) {
  testthat::expect_equal(pure(a) %>-% h, h(a))
}

expect_holds_right_identity <- function(pure, m) {
  testthat::expect_equal(m %>-% pure, m)
}

expect_holds_associativity <- function(h, g, m) {
  testthat::expect_equal((m %>-% g) %>-% h, m %>-% \(x) g(x) %>-% h)
}

# https://wiki.haskell.org/Functor#Functor_Laws
expect_holds_preserve_identity <- function(m) {
  testthat::expect_equal(m %>>% identity, m |> identity())
}

expect_holds_preserve_composition <- function(f, g, m) {
  testthat::expect_equal(m %>>% (f %.% g), m %>>% g %>>% f)
}

`%.%` <- \(f, g) \(x) f(g(x))
