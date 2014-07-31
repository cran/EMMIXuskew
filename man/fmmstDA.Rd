\name{fmmstDA}
\alias{fmmstDA} 
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Discriminant analysis using Multivariate Skew t Mixture Models
}
\description{
performs discriminant analysis (DA) for a specified multivariate skew t mixture distribution.
}
\usage{
fmmstDA(g, dat, model, tmethod=1)  
}
\arguments{
  \item{g}{
   a scalar specifying the number of components in the mixture model
}
  \item{dat}{
    the data matrix giving the coordinates of the point(s) to be classified.
}
  \item{model}{
    a list containing the parameters of the model, including \code{mu}, \code{sigma}, 
    \code{delta}, \code{dof} (for \code{fmmstDA} only) and \code{pro}.
}
  \item{tmethod}{
  (optional) an integer indicating which method to use when computing t distribution function values. 
  See \code{\link{pmt}} for details.
}
}
\details{
For the structure of the elements of \code{model}, see \code{\link{dfmmst}}.
}
\value{
\code{fmmstDA} returns a vector of length \code{nrow(dat)} of the cluster labels
}

%% ~Make other sections like Warning with \section{Warning }{....} ~
\section{references}{
Lee, S. and McLachlan, G.J. (2013) EMMIXuskew: An \code{R} package for
fitting mixtures of multivariate skew t-distributions via the EM algorithm.
Journal of Statistical Software, 55(12), 1-22.
URL \url{http://www.jstatsoft.org/v55/i12/}.
}
\seealso{
\code{\link{dfmmst}}, \code{\link{fmmst}}
}
\examples{
obj <- list()
obj$mu <- list(c(17,19), c(5,22), c(6,10))
obj$sigma <- list(diag(2), matrix(c(2,0,0,1),2), matrix(c(3,7,7,24),2))
obj$delta <- list(c(3,1.5), c(5,10), c(2,0))
obj$dof <- c(1, 2, 3)
obj$pro <- c(0.25, 0.25, 0.5)
X2 <- rfmmst(3, 50, known=obj)
fmmstDA(3, X2[,1:2], obj)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
