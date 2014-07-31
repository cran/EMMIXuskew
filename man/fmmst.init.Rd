\name{fmmst.init}
\alias{fmmst.init}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Initialization for Fitting Finite Mixtures of Unrestricted Multivariate Skew t Distributions
}
\description{
Computes different sets of initial values for finite mixtures of unrestricted 
multivariate skew t (FM-uMST) model based on an initial clustering.
}
\usage{
fmmst.init(g, dat, known=NULL, clust=NULL, nkmeans=20, tmethod=1)
}
\arguments{
  \item{g}{
    a scalar specifying the number of components in the mixture model
}
  \item{dat}{
    the data matrix giving the coordinates of the point(s) where the density is evaluated.
    This is either a vector of length \code{p} or a matrix with \code{p} columns.
}
  \item{known}{
  (optional) a list containing parameters of the mixture model that are known
  and not required to be estimated. See the 'Details' section. The default is \code{NULL}.
}
  \item{clust}{
  (optional) a numeric value of length \code{nrow(dat)} containing the 
  initial labels for each data point in \code{dat}. The default is \code{NULL},
  indicating no initial clustering is known.
}
  \item{nkmeans}{
  (optional) a numeric value indicating how many k-means trials to be used 
  when searching for initial values. The default is \code{20}.
}
  \item{tmethod}{
  (optional) an integer indicating which method to use when computing t distribution function values. 
  See \code{\link{pmt}} for details.
}
}
\details{
As the EM algorithm is sensitive to the starting value, 
it is highly recommended to apply a wide range different initializations.
To obtain different sets of starting values using the strategy described in 
Section 5.1.3 of Lee and McLachlan (2014), \code{fmmst.init()} can be used, 
which will return a list of objects with the same structure as \code{initial}.
An example is given in the examples section below.
                                                          
The argument \code{known}, if specified, is a list structure containing
at least one of \code{mu}, \code{sigma}, \code{delta}, \code{dof}, \code{pro} 
(See \code{\link{dfmmst}} for the structure of each of these elements). 
Note that although not all parameters need to be provided in \code{known}, 
the parameters that are provided must be fully specified. 
They cannot be partially specified, e.g. only some elements or some components are specified. 
}
\value{
a list of initializations for \code{fmmst}, each containing the following parameters:
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
   an \code{g} by \code{n} matrix of initial probability of component membership. 
}
  \item{clusters}{
   a vector of length {n} of initial partition.  
}
  \item{loglik}{
   the initial log likelihood value.    
}
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
\seealso{
\code{\link{rfmmst}}, \code{\link{dfmmst}}, \code{\link{fmmst.contour.2d}}
}
\examples{
#a short demo using AIS data
data(ais)
Fit.init <- fmmst.init(2, ais[,c(2,12)])  

#the number of available initializations
length(Fit.init)  

#getting the first set of available initialization
Fit.init[[1]]     
\dontrun{
Fit1 <- fmmst(2, ais[,c(2,12)], initial=Fit.init[[1]])
Fit2 <- fmmst(2, ais[,c(2,12)], initial=Fit.init[[2]])
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ EM algorithm }
\keyword{ multivariate skew t }% __ONLY ONE__ keyword per line
\keyword{ maximum likelihood estimation}
