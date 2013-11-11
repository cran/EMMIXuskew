\name{fmmst}
\alias{fmmst}
\alias{summary.fmmst}
\alias{print.fmmst}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fitting Finite Mixtures of Unrestricted Multivariate Skew t Distributions
}
\description{
Computes maximum likelihood estimators (MLE) for finite mixtures of unrestricted 
multivariate skew t (FM-MST) model via the EM algorithm.
}
\usage{
fmmst(g = 1, dat, initial = NULL, known = NULL, itmax = 100, 
    eps = 1e-03, nkmeans=20, print = T, tmethod=1)
\method{summary}{fmmst}(object, ...)
\method{print}{fmmst}(x, ...)
}
\arguments{
  \item{object, x}{
    an object class of class \code{"fmmst"}, i.e. a fitted model.
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
  \item{tmethod}{
  (optional) an integer indicating which method to use when computing t distribution function values. 
  See \code{\link{pmt}} for details.
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
  \item{delta}{
    a list of \code{g} numeric matrices containing the skewness parameter for each component.
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
Lee S, McLachlan G (2011). On the fitting of mixtures of multivariate skew t-distributions
via the EM algorithm. arXiv:1109.4706 [stat.ME]

Lee, S. and McLachlan, G.J. (2013) Finite mixtures of multivariate 
skew t-distributions: some recent and new results. 
Statistics and Computing. To appear

Lee, S. and McLachlan, G.J. (2013) EMMIXuskew: An \code{R} package for
fitting mixtures of multivariate skew t-distributions via the EM algorithm.
Journal of Statistical Software, 55(12), 1-22.
URL http://www.jstatsoft.org/v55/i12/.
 
}
\seealso{
\code{\link{rfmmst}}, \code{\link{dfmmst}}, \code{\link{fmmst.contour.2d}}
}
\examples{
#a short demo using AIS data
data(ais)
Fit <- fmmst(2, ais[,c(2,12)], itmax=5) 
summary(Fit)
print(Fit)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ EM algorithm }
\keyword{ multivariate skew t }% __ONLY ONE__ keyword per line
\keyword{ maximum likleihood estimation}
