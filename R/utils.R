check_installed <- function(package) {
  if (!requireNamespace(package, quietly = TRUE)) {
    stop(sprintf("The package \"%s\" is required.", package), call. = FALSE)
  }
}
