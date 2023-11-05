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
  # Handle "special" calls that can occur as RHS.
  if (func == quote(`function`) || func == quote(`(`)) {
    func <- list(rhs)
    args <- list()
  }
  as.call(c(opfunc, lhs, func, args))
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
