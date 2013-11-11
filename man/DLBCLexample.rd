\name{DLBCLexample}
\alias{DLBCLexample}  
\alias{Fit6}
\alias{uMat} 
\alias{wSize}
\docType{data}
\title{
Example results on a Diffuse Large B-cell Lymphoma (DLBCL) data
}
\description{
A sample from the Diffuse Large B-cell Lymphoma (DLBCL) dataset from FlowCAP I 
is fitted with a FM-uMST model.
The original data contain measurements from biopsies of 30 DLBCL patients.
Each sample was stained with three antibodies, CD3, CD5, and CD19.
This is a subset from one patient.
}
\usage{data(DLBCLexample)}
\format{
  This example data contains the model parameters of the fitted FM-uMST model,
  and other values used to produce the Figure 2 given in Lee and McLachlan(2013).
  \describe{
    \item{\code{Fit6}}{an fmmst object of the fitted model}
    \item{\code{uMat}}{rgl paramemters}
    \item{\code{wSize}}{window size of the figure}
  }
}
%%\details{
%%  ~~ If necessary, more details than the __description__ above ~~
%%}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
The raw data is available from the FlowRepository database.
\url{https://flowrepository.org/id/FR-FCM-ZZYY}
}
\references{
%%  ~~ possibly secondary sources and usages ~~
Spidlen J, Breuer K, Rosenberg C, Kotecha N and Brinkman RR.
FlowRepository - A Resource of Annotated Flow Cytometry Datasets Associated
with Peer-reviewed Publications.
Cytometry A. 2012 Sep; 81(9):727-31. PMID: 22887982.   

Lee, S. and McLachlan, G.J. (2013) EMMIXuskew: An \code{R} package for
fitting mixtures of multivariate skew t-distributions via the EM algorithm.
Journal of Statistical Software, 55(12), 1-22.
URL http://www.jstatsoft.org/v55/i12/.
}
\examples{
data(DLBCLexample)
  \dontrun{
    fmmst.contour.3d(model=Fit6, level=0.985, drawpoints=FALSE, 
      xlab="CD3", ylab="CD5", zlab="CD19", smooth=4, 
      xlim=c(-100, 750), ylim=c(-200, 1050), zlim=c(-100,700), grid=35, component=1:4)
    
    par3d("zoom"=0.8638377, "userMatrix" = matrix(uMat,4,4), windowRect=wSize)
  }
}
\keyword{datasets}
