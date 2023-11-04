# Construct a pipe operator for a function.
pipeop <- function(func) {
  func <- substitute(func)
  function(lhs, rhs) {
    lhs <- substitute(lhs)
    rhs <- substitute(rhs)
    if (!is.call(rhs)) {
      stop(sprintf("`rhs` must be a call, not a %s.", typeof(rhs)))
    }
    expr <- pipecall(func, lhs, rhs)
    eval.parent(expr)
  }
}

# Create a call to opfunc from the lhs and rhs of a pipe operator.
pipecall <- function(opfunc, lhs, rhs) {
  lhs <- list(lhs)
  func <- rhs[[1]]
  args <- as.list(rhs[-1])
  if (func == quote(`function`)) {
    # RHS is an anonymous function.
    func <- list(rhs)
    args <- list()
  }
  as.call(c(opfunc, lhs, func, args))
}

# A convenient form for testing.
# pipecallq(fmap, m %>>% f(x))
# pipecallq(bind, m %>-% f(x))
pipecallq <- function(func, expr) {
  func <- substitute(func)
  expr <- substitute(expr)
  stopifnot(is.call(expr) && length(expr) == 3)
  lhs <- expr[[2]]
  rhs <- expr[[3]]
  pipecall(func, lhs, rhs)
}
