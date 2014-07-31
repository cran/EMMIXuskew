\name{fmmst.contour.2d}
\alias{fmmst.contour.2d}
\alias{fmmst.contour.3d}  
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
2D and 3D Visualisation of Fitted Contours
}
\description{
Create 2D or 3D contour plot.
}
\usage{   
fmmst.contour.2d(dat, model, grid = 50, drawpoints = TRUE, clusters=NULL, levels = 10, 
    map = c("scatter", "heat", "cluster"), component = NULL, 
    xlim, ylim, xlab, ylab, main, tmethod=1, ...)         
fmmst.contour.3d(dat, model, grid=20, drawpoints=TRUE, levels=0.9, 
    clusters=NULL, xlim, ylim, zlim, xlab, ylab, zlab, main, component=NULL, ...)
}
\arguments{
  \item{dat}{
    the data matrix giving the coordinates of the point(s) where the density is evaluated.
    This must be a matrix with at least \code{2} columns for \code{fmmst.contour.2d} 
    or \code{3} columns for \code{fmmst.contour.3d}.
    If \code{dat} is not provided, then \code{xlim}, \code{ylim} and \code{zlim}
    must be provided, and \code{drawpoints} must be set to \code{FALSE}.
}
  \item{model}{
    a list containing the parameters of the model and also a vector of cluster labels for \code{dat}. 
    This is typically an output from \code{\link{fmmst}}, 
    containing \code{mu}, \code{sigma}, \code{delta}, \code{dof}, 
    \code{pro} and \code{clusters}; see \code{\link{fmmst}} for structure of \code{model}.
}
  \item{grid}{
  a positive integer specifying the grid size used to calculate the density map.
}
  \item{drawpoints}{
    logical. Points are plotted if \code{TRUE}.
}
  \item{clusters}{
  a vector of cluster labels to be applied when colouring the points. 
  This only applies when \code{drawpoints} is \code{TRUE}.
}
  \item{levels}{
  either a positive integer specifying the number of contour levels to draw 
  or a numeric vector of contour levels to be drawn
}
  \item{map}{
   character string specifying how to plot the points if \code{drawpoints=TRUE}.
   Possible values are \code{"scatter"} (default), \code{"heat"} and \code{"cluster"}.
   See the 'Details' section.
}
  \item{component}{
    the index of the components to be plotted. See the 'Details' section.
}
  \item{xlim, ylim, zlim}{
    x-, y- and z- limits for the plot
}
  \item{xlab, ylab, zlab}{
    labels for x-, y-  and z- axis
}
  \item{main}{
    title of the plot
}
  \item{tmethod}{
  (optional) an integer indicating which method to use when computing t distribution function values. 
  See \code{\link{pmt}} for details.
}
  \item{\dots}{
    additional arguments to \code{\link{plot.default}}
}
}
\details{
\code{fmmst.contour.2d} draw contour plots for bivariate densities. 
The argument \code{dat} must be provided and must contain at least \code{2} columns.
Note that only the first two columns of \code{dat} will be used if \code{dat} have more than \code{2} columns.
For bivariate datset, the data points can be drawn as a scatter plot by specifying \code{map="scatter"} (default),
or as an intensity plot (\code{map="heat"}). 
Alternatively, a cluster map can be drawn instead (\code{map="cluster"}). 
Note that if an intensity plot is used, the data points will not be drawn, that is,
\code{drawpoints} will be set to \code{FALSE}.

The argument \code{component} specifies which individual component is drawn.
When \code{component=FALSE}, the mixture contour is drawn. 
If specified, \code{component} is a integer vector of the index of the components
to be drawn. It can only take values between \code{1} an \code{g} inclusive.
For example, \code{component=c(1,3)} will draw the first and third component contours.

If the argument \code{model} contains the cluster labels (\code{model$clusters}), 
the data point will be coloured according to their cluster.  
}
\seealso{
  \code{\link{fmmst}}, \code{\link{contour}}
}
\examples{
#2D plots
obj <- list()
obj$mu <- list(c(17,19), c(5,22), c(6,10))
obj$sigma <- list(diag(2), matrix(c(2,0,0,1),2), matrix(c(3,7,7,24),2))
obj$delta <- list(c(3,1.5), c(5,10), c(2,0))
obj$dof <- c(1, 2, 3)
obj$pro <- c(0.25, 0.25, 0.5)
mySample <- rfmmst(3, 500,known=obj)
obj$clusters <- mySample[,3]

par(mfrow=c(2,2))
fmmst.contour.2d(mySample, model=obj, clusters=obj$clusters) 
fmmst.contour.2d(mySample[,1:2], model=obj, clusters=obj$clusters, map="heat") 
fmmst.contour.2d(mySample[,1:2], model=obj, clusters=obj$clusters, map="cluster")   
fmmst.contour.2d(mySample[,1:2], model=obj, clusters=obj$clusters, component=1)


#3D plot
\dontrun{
  obj <- list()
  obj$mu <- list(c(420,360,425), c(160,570,200), c(320,540,260), c(530,80,450))
  obj$sigma <- 
      list(matrix(c(9160,5580,7000,5580,12105,7160,7000,7160,7250),3,3),
      matrix(c(3870,1810,1770,1810,2900,1270,1770,1270,1320),3,3),
      matrix(c(1695,1190,2280,1190,2780,2010,2280,2010,3720),3,3),
      matrix(c(1590,590,15,590,2425,415,15,415,1870),3,3))
  obj$delta <- list(c(4.8,-17,-50), c(-4,-80,-60), c(-40,8,-10), c(-60,90,-6))
  obj$dof <- c(10,30,40,40)
  obj$pro <- c(0.125, 0.19, 0.135, 0.55) 
  mySample <- rfmmst(4, 10000, known=obj)
  obj$clusters <- mySample[,4]  
  fmmst.contour.3d(mySample[,1:3], model=obj, levels=0.95, 
      drawpoints=F, clusters=obj$clusters, component=1:4)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ contour }
\keyword{ 3d }% __ONLY ONE__ keyword per line
