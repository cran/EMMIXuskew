\name{fmmt}
\alias{fmmt}
\alias{summary.fmmt}
\alias{print.fmmt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fitting Finite Mixtures of Unrestricted Multivariate t Distributions
}
\description{
Computes maximum likelihood estimators (MLE) for finite mixtures of
multivariate t (FM-MT) model via the EM algorithm.
}
\usage{
fmmt(g = 1, dat, initial = NULL, known = NULL, itmax = 100,
    eps = 1e-03, nkmeans=20, print = T)
\method{summary}{fmmt}(object, ...)
\method{print}{fmmt}(x, ...)
}
\arguments{
  \item{object, x}{
    an object class of class \code{"fmmt"}, i.e. a fitted model.
}
  \item{g}{
    a scalar specifying the number of components in the mixture model
}
  \item{dat}{
    the data matrix giving the coordinates of the point(s) where the density is evluated.
    This is either a vector of length \code{p} or a matrix with \code{p} columns.
}
  \item{initial}{
  (optional) a list containing the initial parameters of the mixture model.
  See the 'Details' section. The default is \code{NULL}.
}
  \item{known}{
  (optional) a list containig parameters of the mixture model that are known
  and not required to be estimated. See the 'Details' section. The default is \code{NULL}.
}
  \item{itmax}{
  (optional) a positive integer specifying the maximum number of EM iterations
  to perform. The default is \code{100}.
}
  \item{eps}{
  (optional) a numeric value used to control the termination criteria for the EM loops.
  It is the maximum tolerance for the absolute difference between the log-likleihood value
  and the asymptotic log likelihood value. The default is \code{1e-6}.
}
  \item{nkmeans}{
  (optional) a numeric value indicating how many k-means trials to be used 
  when searching for the best initial values. The default is \code{20}.
} 
  \item{print}{
  (optional) a logical value. If \code{TRUE}, output for each iteration will be printed out.
  if \code{FALSE}, no output is printed. The default is \code{TRUE}. See the 'Details' section.
}
  \item{\dots}{ not used. }
}
\details{
The arguments \code{init} and \code{known}, if specified, is a list structure containing
at least one of \code{mu}, \code{sigma}, \code{delta}, \code{dof}, \code{pro}
(See \code{\link{dfmmst}} for the structure of each of these elements).
If \code{init=FALSE} (default), the program uses an automatic approach based on
k-means clustering to generate an initial value for the model parameters.
}
\value{
  \item{mu}{
    a list of \code{g} numeric matrices containing the location parameter for each component.
}
  \item{sigma}{
    a list of \code{g} numeric matrices containing the scale parameter for each component.
}
  \item{dof}{
    a numeric vector of length \code{g} representing the degrees of freedom for each component.
}
  \item{pro}{
    a vector of length of \code{g} specifying the mixing proportions for each component.
}
  \item{tau}{
   an \code{g} by \code{n} matrix of posterior probability of component membership.
}
  \item{clusters}{
   a vector of length {n} of final partition.
}
  \item{loglik}{
   the final log likelihodd value.
}
  \item{lk}{
   a vector of log likelihood values at each EM iteration.
}
  \item{iter}{
   number of iterations performed.
}
  \item{eps}{
   the final absolute difference between the log likelihood value and the asymptotic log likelihood value.
} 
  \item{aic, bic}{
   Akaike Information Criterion (AIC), Bayes Information Criterion (BIC)
}
}
\references{
McLachlan G.J. and Krishnan T. (2008). The EM Algorithm and Extensions (2nd). New Jersay:
Wiley.

McLachlan G.J. and Peel D. (2000). Finite Mixture Models. New York: Wiley.
}
\seealso{
\code{\link{rfmmst}}, \code{\link{dfmmst}}, \code{\link{fmmst.contour.2d}}
}
\examples{
#a short demo using AIS data
data(ais)
Fit <- fmmt(2, ais[,c(2,12)], itmax=10)
summary(Fit)
print(Fit)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ EM algorithm }
\keyword{ multivariate skew t }% __ONLY ONE__ keyword per line
\keyword{ maximum likleihood estimation}
