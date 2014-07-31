\name{dfmmst}
\alias{dfmmst}
\alias{dmst}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Multivariate skew t distribution
}
\description{
The probability density function for the unrestricted 
multivariate skew t (MST) distribution 
and finite mixture of MSN and MST distributions
}
\usage{
dfmmst(dat, mu = NULL, sigma = NULL, delta = NULL, dof = NULL, pro = NULL, 
    known = NULL, tmethod=1)               
dmst(dat, mu = NULL, sigma = NULL, delta = NULL, dof = 1, known = NULL, tmethod=1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
    the data matrix giving the coordinates of the point(s) where the density is evaluated.
    This is either a vector of length \code{p} or a matrix with \code{p} columns.
}
  \item{mu}{
    for \code{dmst}, this is a numeric vector of length \code{p} representing the location parameter;
    for \code{dfmmst}, this is list of \code{g} numeric matrices each having \code{p} rows and \code{1} column
    containing the location parameter for each component.
}
  \item{sigma}{
    for \code{dmst}, this is a numeric positive definite matrix with dimension \code{(p,p)} representing the scale parameter;
    for \code{dfmmst}, this is list of \code{g} numeric matrices containing the scale parameter for each component.   
}
  \item{delta}{
    for \code{dmst}, this is a numeric vector of length \code{p} representing the skewness parameter;
    for \code{dfmmst}, this is list of \code{g} numeric matrices each having \code{p} rows and \code{1} column
    containing the skewness parameter for each component.
}
  \item{dof}{
    for \code{dmst}, this is a positive integer specifying the degrees of freedom;
    for \code{dfmmst}, this is numeric vector of length \code{g} representing the degrees of freedom for each component.
}
  \item{pro}{
    the mixing proportions; for\code{dmst}, this is equal to \code{1};
    for \code{dfmmst}, this is vector of length of \code{g}
    specifying the mixing proportions for each component.
}
  \item{known}{
    a list containing the parameters of the model. 
    If specified, it overwrites the values of \code{mu}, \code{sigma}, 
    \code{delta}, \code{dof} and \code{pro}.
} 
  \item{tmethod}{
  (optional) an integer indicating which method to use when computing t distribution function values. 
  See \code{\link{pmt}} for details.
}
}
\details{
The function \code{dmst} computes the density value of a specified unrestricted 
multivariate skew t (MST) distribution. 
If any model parameters are not specified, their default values are used:
\code{mu} and \code{delta} are zero vectors, \code{sigma} is the identity matrix,
and \code{dof} is \code{1}.
 
The function \code{dfmmst} computes the density value for a specified mixture of
MST distribution. Note that \code{dfmmst} expects at least \code{dof} is specified.
Other missing parameters will take the default value described above. 
When \code{g=1}, \code{dfmmst} passes the call to \code{dmst}. 
Model parameters can be passed to \code{dmst} and \code{dfmmst} 
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
\code{dmst} and \code{dfmmst} returns a numeric vector of density values
}
\references{
%% ~put references to the literature/web site here ~
Sahu S, Dey D, Branco M (2003). A New Class of Multivariate Skew Distributions with
Applications to Bayesian Regression Models. The Canadian Journal of Statistics, 31,
129-150.

Lee S, McLachlan G (2011). On the fitting of mixtures of multivariate skew t-distributions via the
EM algorithm. arXiv:1109.4706 [stat.ME]

Lee, S. and McLachlan, G.J. (2014) Finite mixtures of multivariate 
skew t-distributions: some recent and new results. 
Statistics and Computing, 24, 181-202. 
}
%%\author{
%%  ~~who you are~~
%%}
%%\note{
%%  ~~further notes~~
%%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{rmst}}, \code{\link{rfmmst}}
}
\examples{           
dmst(c(1,2), mu=c(1,5), sigma=diag(2), delta=c(-3,1), dof=4)
obj <- list()
obj$mu <- list(c(17,19), c(5,22), c(6,10))
obj$sigma <- list(diag(2), matrix(c(2,0,0,1),2), matrix(c(3,7,7,24),2))
obj$delta <- list(c(3,1.5), c(5,10), c(2,0))
obj$dof <- c(1, 2, 3)
obj$pro <- c(0.25, 0.25, 0.5)     
dfmmst(matrix(c(1,2,5,6,2,4),3,2), obj$mu, obj$sigma, obj$delta, 
    obj$dof, obj$pro)
dfmmst(c(1,2), known=obj)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ mixture density }
\keyword{ multivariate skew t }% __ONLY ONE__ keyword per line
\keyword{ multivariate distribution }
