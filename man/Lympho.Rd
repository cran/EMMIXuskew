\name{Lympho}
\alias{Lympho}
\docType{data}
\title{
T-cell Phosphorylation dataset
}
\description{
A subset of the T-cell phosphorylation dataset. 
The original data contain measurements of blood samples stained with four antibodies, CD4, CD45RA, SLP76 and ZAP70.
Measurements from each subject were taken before and after anti-CD3 stimulation.
This is a subset of the pre-stimulation data from one subject.  
}
\usage{data(Lympho)}
\format{
  A data frame with 33399 observations (rows) on the following 2 variables (columns).
  \describe{
    \item{\code{SLP76}}{marker 1}
    \item{\code{ZAP70}}{marker 2}
  }
}
%%\details{
%%  ~~ If necessary, more details than the __description__ above ~~
%%}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
Data is available from the GenePattern website.
\url{http://www.broadinstitute.org/cancer/software/genepattern/modules/FLAME/published_data.}
}
\references{
%%  ~~ possibly secondary sources and usages ~~
Maier LM, Anderson DE, De Jager PL, Wicker L, Hafler DA (2007). 
Allelic variant in CTLA4 alters T cell phosphorylation patterns.
Proceedings of the National Academy of Sciences of the United States of America, 104, 18607-18612.
}
\examples{
data(Lympho)
plot(Lympho, main="Lymphoma dataset")
smoothScatter(Lympho, nrpoints=Inf)
}
\keyword{datasets}
