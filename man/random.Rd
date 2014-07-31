\name{rfmmst}
\alias{rfmmst}
\alias{rmst}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Simulation of Mixture Data
}
\description{
Generate random sample from a specified mixture of 
unrestricted multivariate skew t distribution
}
\usage{
rfmmst(g, n, mu, sigma, delta, dof = rep(10, g), 
    pro = rep(1/g, g), known = NULL)  
rmst(n, mu, sigma, delta, dof=1, known)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{g}{
    a scalar specifying the number of components in the mixture model
}
  \item{n}{
    either a positive integer specifying the total number of points to be generated
    or a vector (of length \code{g}) of positive integers specifying the number of points to be generated in each component.
}
  \item{mu}{
    for \code{rmst}, this is a numeric vector of length \code{p} representing the location parameter;
    for \code{rfmmst}, this is list of \code{g} numeric matrices each having \code{p} rows and \code{1} column
    containing the location parameter for each component.
}
  \item{sigma}{
    for \code{rmst}, this is a numeric positive definite matrix with dimension \code{(p,p)} representing the scale parameter;
    for \code{rfmmst}, this is list of \code{g} numeric matrices containing the scale parameter for each component.
}
  \item{delta}{
    for \code{rmst}, this is a numeric vector of length \code{p} representing the skewness parameter;
    for \code{rfmmst}, this is list of \code{g} numeric matrices each having \code{p} rows and \code{1} column
    containing the skewness parameter for each component.
}
  \item{dof}{
    for \code{rmst}, this is a positive integer specifying the degrees of freedom;
    for \code{rfmmst}, this is numeric vector of length \code{g} representing the degrees of freedom for each component.
}
  \item{pro}{
    the mixing proportions; for \code{rmst}, this is equal to \code{1};
    for \code{rfmmst}, this is vector of length of \code{g}
    specifying the mixing proportions for each component.
}
  \item{known}{
    a list containing the parameters of the model. 
    If specified, it overwrites the values of \code{mu}, \code{sigma}, 
    \code{delta}, \code{dof} and \code{pro}.
}
}
\details{
\code{rmst} generates a sample \code{n} multivariate skew t (MST) variables.
\code{rfmmst} generates a mixture of MST samples. 
Note that model parameters can be passed to \code{rmst} and \code{rfmmst} 
through the argument \code{known} or listed as individual arguments.
If both methods of input were used, the parameters specified in \code{known}
will be used.    
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\code{rmst} returns an \code{n} by \code{p} numeric matrix of generated data.
\code{rfmmst} returns an \code{n} by \code{p+1} numeric matrix of genertaed data.
The first \code{p} gives the coordinates of the generated data. 
The last column specifies which component each data point is generated from.
}
\references{
Lee S, McLachlan G (2011). On the fitting of mixtures of multivariate skew t-distributions
via the EM algorithm. arXiv:1109.4706 [stat.ME]

Lee, S. and McLachlan, G.J. (2014) Finite mixtures of multivariate 
skew t-distributions: some recent and new results. 
Statistics and Computing, 24, 181-202. 

Lee, S. and McLachlan, G.J. (2013) EMMIXuskew: An \code{R} package for
fitting mixtures of multivariate skew t-distributions via the EM algorithm.
Journal of Statistical Software, 55(12), 1-22.
URL \url{http://www.jstatsoft.org/v55/i12/}.
}
%%\author{
%%  ~~who you are~~
%%}
%%\note{
%%  ~~further notes~~
%%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{dmst}}, \code{\link{dfmmst}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
rfmmst(1,500, c(1,2), diag(2), c(-1,1), 4, 1)
obj <- list()
obj$mu <- list(c(17,19), c(5,22), c(6,10))
obj$sigma <- list(diag(2), matrix(c(2,0,0,1),2), matrix(c(3,7,7,24),2))
obj$delta <- list(c(3,1.5), c(5,10), c(2,0))
obj$dof <- c(1, 2, 3)
obj$pro <- c(0.25, 0.25, 0.5)
rfmmst(3, 250, obj$mu, obj$sigma, obj$delta, obj$dof, obj$pro)
rfmmst(3, 500, known=obj)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ random number }
\keyword{ multivariate skew t }% __ONLY ONE__ keyword per line
\keyword{ multivariate distribution }
