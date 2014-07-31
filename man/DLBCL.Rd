\name{DLBCL}
\alias{DLBCL}  
\alias{DLBCL}
\alias{true.clusters} 
\docType{data}
\title{
A Diffuse Large B-cell Lymphoma (DLBCL) data
}
\description{
A sample from the Diffuse Large B-cell Lymphoma (DLBCL) dataset from Aghaeepour et al. (2013).
The original data contain measurements from biopsies of 30 DLBCL patients.
Each sample was stained with three antibodies, CD3, CD5, and CD19.
This is a subset from one patient.
}
\usage{data(DLBCL)}
\format{
  \code{DLBCL} is a data frame with over 8000 observations (rows) on the following 3 markers (rows).
  \describe{
    \item{\code{CD3}}{marker 1}
    \item{\code{CD5}}{marker 2}
    \item{\code{CD19}}{marker 3}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
\code{DLBCL} is a data frame as described above.
\code{true.clusters} is a set of cluster labels given by manual gating.
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
The raw data is available from the FlowRepository database.
\url{https://flowrepository.org/id/FR-FCM-ZZYY}
}
\references{
%%  ~~ possibly secondary sources and usages ~~
Spidlen J, Breuer K, Rosenberg C, Kotecha N and Brinkman RR. (2012)
FlowRepository - A Resource of Annotated Flow Cytometry Datasets Associated
with Peer-reviewed Publications.
Cytometry A, 81(9):727-31.   

Aghaeepour et al. (2013) Critical assessment of automated flow cytometry 
analysis techniques. Nature Methods, 10, 228-238.      

Lee, S. and McLachlan, G.J. (2013) EMMIXuskew: An \code{R} package for
fitting mixtures of multivariate skew t-distributions via the EM algorithm.
Journal of Statistical Software, 55(12), 1-22.
URL \url{http://www.jstatsoft.org/v55/i12/}.
}
\examples{
data(DLBCL)
\dontrun{
RNGversion("3.0.2");  set.seed(240)
Fit <- fmmst(4, DLBCL, nkmeans=1)
fmmst.contour.3d(DLBCL, model = Fit, level = 0.985, drawpoints = FALSE, 
  xlab="CD3", ylab="CD5", zlab="CD19", component=1:4)
}
}
\keyword{datasets}
