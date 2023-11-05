# https://wiki.haskell.org/Monad_laws
expect_left_identity <- function(pure, h, a) {
  expect_equal(pure(a) %>-% h, h(a))
}

expect_right_identity <- function(pure, m) {
  expect_equal(m %>-% pure, m)
}

expect_associativity <- function(h, g, m) {
  expect_equal((m %>-% g()) %>-% h, m %>-% \(x) g(x) %>-% h)
}
