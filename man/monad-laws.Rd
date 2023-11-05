% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/monad-laws.R
\name{monad-laws}
\alias{monad-laws}
\alias{expect_left_identity}
\alias{expect_right_identity}
\alias{expect_associativity}
\title{Monad Laws}
\usage{
expect_left_identity(pure, h, a)

expect_right_identity(pure, m)

expect_associativity(h, g, m)
}
\arguments{
\item{pure}{The function to wrap a value in the monad.}

\item{h, g}{Functions that return monadic objects.}

\item{a}{Any object.}

\item{m}{A monadic object.}
}
\description{
Classes implementing \code{\link[=bind]{bind()}} or \code{\link[=join]{join()}} are expected to satisfy three monad
laws. Functions to test if the laws hold are provided for use with the
\code{testthat} package.
}
\details{
The Haskell monad laws have been translated to R in the expectations as
follows:

\describe{
\item{Left identity:}{\code{pure(a) \%>-\% h} is equal to \code{h(a)}.}
\item{Right identity:}{\code{m \%>-\% pure} is equal to \code{m}.}
\item{Associativity:}{\code{(m \%>-\% g) \%>-\% h} is equal to \verb{m \%>-\% \\(x) g(x) \%>-\% h}.}
}
}
\references{
\url{https://wiki.haskell.org/Monad_laws}
}
\seealso{
Other implementation laws: 
\code{\link{functor-laws}}
}
\concept{implementation laws}