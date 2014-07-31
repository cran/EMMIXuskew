\name{delta.test}
\alias{delta.test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Testing for the significance of the skewness parameter in a FM-MST model
}
\description{
Perform a likelihood ratio for the significance of the skewness parameter
\code{delta} in a multivariate skew t-mixture model.
}
\usage{
delta.test(stmodel=NULL, tmodel=NULL, stloglik, tloglik, r)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{stmodel}{a list containing the parameters of the FM-MST model, 
    including \code{mu}, \code{sigma}, \code{delta}, \code{dof} and \code{pro}.
    This is usually an output from a \code{fmmst} run.
}
  \item{tmodel}{a list containing the parameters of the FM-MT model, 
    including \code{mu}, \code{sigma}, \code{dof} and \code{pro}.
    This is usually an output from a \code{fmmt} run.      
}
  \item{stloglik}{a scalar specifying the log likelihood value of 
  the skew t-mixture model
}
  \item{tloglik}{a scalar specifying the log likelihood value of 
  the t-mixture model
}
  \item{r}{a scalar specifying the difference in the number of parameters between 
  FM-MST and FM-MT model
}
}
\details{
A likelihood ratio test for hypotheses:

H0: delta = 0 (for all components in the mixture model)

H1: delta different from 0 (for at least one component in the mixture)

The test statistics is LR = -2 (L1 - L2), which follows
a chi-sqaured distribution with r degrees of freedom under H0.
r is the difference between the number of parameters in H0 and H1.
See references for further details.
}
\value{
returns the P-value of the test
}
\references{
Lee, S. and McLachlan, G.J. (2013) EMMIXuskew: An \code{R} package for
fitting mixtures of multivariate skew t-distributions via the EM algorithm.
Journal of Statistical Software, 55(12), 1-22.
URL \url{http://www.jstatsoft.org/v55/i12/}.
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{fmmt}}, \code{\link{fmmst}}
}
\examples{
delta.test(stloglik=-1343.541, tloglik=-1353.842, r=4)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ mixture density }
\keyword{ multivariate skew t }% __ONLY ONE__ keyword per line
\keyword{ multivariate distribution }
