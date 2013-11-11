\name{ais}
\alias{ais}
\docType{data}
\title{
Australian Institute of Sports (AIS) data
}
\description{
Data on 102 male and 100 female atheles collected at the Australian Insitute of Sport.
}
\usage{data(ais)}
\format{
  A data frame with 202 observations (rows) on the following 14 variables (columns).
  \describe{
    \item{\code{Sex}}{0 = male or 1 = female}
    \item{\code{Ht}}{Height in cm}
    \item{\code{Wt}}{Weight in kg}
    \item{\code{LBM}}{Lean body mass}
    \item{\code{RCC}}{Red cell count}
    \item{\code{WCC}}{White cell count}
    \item{\code{Hc}}{Hematpcrit}
    \item{\code{Hg}}{Hematocrit}
    \item{\code{Ferr}}{Plasma ferritin concerntration}
    \item{\code{BMI}}{Body mass index = weight / (height^2)}
    \item{\code{SSF}}{sum of skin folds}
    \item{\code{Bfat}}{Percent body fat}
    \item{\code{Label}}{case labels: \code{f-b_ball} \code{f-field} \code{f-gym} \code{f-netball} \code{f-row} \code{f-swim} \code{f-t_400m} \code{f-t_sprnt} \code{f-tennis} \code{m-b_ball} \code{m-field} \code{m-row} \code{m-swim} \code{m-t_400m} \code{m-t_sprnt} \code{m-tennis} \code{m-w_polo}}
    \item{\code{Sport}}{Sport: \code{b_ball} \code{field} \code{gym} \code{netball} \code{row} \code{swim} \code{t_400m} \code{t_sprnt} \code{tennis} \code{w_polo}}
  }
}
%%\details{
%%  ~~ If necessary, more details than the __description__ above ~~
%%}
\source{
Richard Telford and Ross Cunningham, Australian National University. 
}
\references{
S. Weisberg (2005). Applied Linear Regression, 3rd edition. New York: Wiley, Section 6.4
}
\examples{
data(ais)
pairs(ais[,2:12], main = "AIS Data", pch = 21, 
    bg = c("red", "blue")[unclass(factor(ais$Sex))], upper.panel=NULL)
legend(0.8, 0.8,legend=c("male", "female"), pt.bg = c("red", "blue"), pch=21)
}
\keyword{datasets}
