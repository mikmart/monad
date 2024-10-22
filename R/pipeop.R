# Construct a pipe operator for a function.
pipeop <- function(func) {
  func <- substitute(func)
  function(lhs, rhs) {
    lhs <- substitute(lhs)
    rhs <- substitute(rhs)
    expr <- pipecall(func, lhs, rhs)
    eval.parent(expr)
  }
}

# Create a call to opfunc from the lhs and rhs of a pipe operator.
pipecall <- function(opfunc, lhs, rhs) {
  lhs <- list(lhs)
  if (!is.call(rhs)) {
    func <- rhs
    args <- list()
  } else {
    func <- rhs[[1]]
    args <- as.list(rhs[-1])
  }
  # Handle "special" calls that can occur as RHS:
  # Anonymous functions and parenthesized expressions.
  if (func == quote(`function`) || func == quote(`(`)) {
    func <- list(rhs)
    args <- list()
  }
  # Forward any args to call to partial application. The resulting call
  # will be evaluated in the user's enviornment, not the package's, so
  # the unexported function won't be visible there without using `:::`.
  if (length(args) > 0) {
    func <- as.call(c(call(":::", quote(monad), quote(partialr)), func, args))
  }
  as.call(c(opfunc, lhs, func))
}

# Hack because we don't have positional-only parameters in the language.
partialr <- function(`_func`, ...) {
  function(`_arg`) `_func`(`_arg`, ...)
}

# A convenient form for testing.
pipecallq <- function(func, expr) {
  func <- substitute(func)
  expr <- substitute(expr)
  stopifnot(is.call(expr) && length(expr) == 3)
  lhs <- expr[[2]]
  rhs <- expr[[3]]
  pipecall(func, lhs, rhs)
}
