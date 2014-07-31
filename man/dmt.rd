\name{dmt}   
\alias{dmt}
\alias{pmt}   
\alias{dfmmt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Multivariate t distribution
}
\description{
The probability density function and distribution function for the multivariate Student t distribution
and mixtures of multivariate t distribution
}
\usage{
dmt(dat, mu, sigma, dof = Inf, log = FALSE)
pmt(dat, mu=rep(0,length(dat)), sigma=diag(length(dat)), dof=Inf, method=1, ...)  
dfmmt(dat, mu = NULL, sigma = NULL, dof = NULL, pro = NULL, known = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
    for \code{dmt}, this is the data matrix giving the coordinates of the point(s) where the density is evaluated.
    for \code{pmt}, this is either a vector of length \code{p}.
    Currently, only \code{p} up to \code{20} dimensions is supported.
}
  \item{mu}{
    a numeric vector of length \code{p} representing the location parameter;
}
  \item{sigma}{
    a numeric positive definite matrix with dimension \code{(p,p)} representing the scale parameter
}
  \item{dof}{
    a positive real number specifying the degrees of freedom. If \code{tmethod=1}, \code{dof} will be rounded to the nearest integer.
} 
  \item{pro}{
    the mixing proportions; for \code{dmt}, this is equal to \code{1};
    for \code{dfmmt}, this is vector of length of \code{g}
    specifying the mixing proportions for each component.
}
  \item{log}{
    a logical value; if \code{TRUE}, the logarithm of the density is computed
}
  \item{\dots}{
    parameters passed to \code{sadmvt}, among maxpts, absrel, releps
  } 
  \item{known}{
    a list containing the parameters of the model. 
    If specified, it overwrites the values of \code{mu}, \code{sigma}, 
    \code{dof} and \code{pro}.
} 
  \item{method}{
    the method to use for computation of t distribution function.
    See description.
}
}
\details{   
There are three options in \code{pmt} for computing multivariate t 
distribution function values.
\code{method=1} uses requires \code{dof} to be an integer. 
This provide interfaces to the Fortran-77 routines by Alan Genz.
This is the fastest method of the three options avilable.
\code{method=2} uses linear interpolation technique to calculate 
t distribution function values for a positive real \code{dof}.
This method requires double the time of method 1.
\code{method=3} uses a method described in Genz and Bretz (2002).
This is the more accurate method for a non-integer \code{dof},
but more computationally intensive than the other two methods.
}
\value{
The function \code{dmt} computes the density value of a specified
multivariate t distribution. \code{pmt} computes the distribution value
for a SINGLE point. \code{dfmmt} returns a numeric vector of mixture density values.
}
\references{
Genz, A.: Fortran code in files \code{mvt.f} and \code{mvtdstpack.f} available at
\url{http://www.math.wsu.edu/math/faculty/genz/software/}

Genz, A. and Bretz, F. (2002). Comparison of Methods for the 
Numerical Computation of Multivariate t Probabilities. 
J. of Comput. Graph. Stat., 11:950-971,
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{dmst}}, \code{\link{dfmmst}}
}
\examples{
x <- seq(-2,4,length=21)
y <- 2*x+10
z <- x+cos(y)
mu <- c(1,12,2)
sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
dof <- 4
f  <- dmt(cbind(x,y,z), mu, sigma,dof)
\dontrun{                      
p1 <- pmt(c(2,11,3), mu, sigma, dof)
p2 <- pmt(c(2,11,3), mu, sigma, dof, maxpts=10000, abseps=1e-8)
}

obj <- list()
obj$mu <- list(c(17,19), c(5,22), c(6,10))
obj$sigma <- list(diag(2), matrix(c(2,0,0,1),2), matrix(c(3,7,7,24),2))
obj$dof <- c(1, 2, 3)
obj$pro <- c(0.25, 0.25, 0.5)
dfmmt(matrix(c(1,2,5,6,2,4),3,2), obj$mu, obj$sigma, obj$dof, obj$pro)
dfmmt(c(1,2), known=obj)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ mixture density }
\keyword{ multivariate skew t }% __ONLY ONE__ keyword per line
\keyword{ multivariate distribution }
