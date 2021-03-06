% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotNorm.R
\name{plotNorm}
\alias{plotNorm}
\title{Plot log2CPM before and after normalization}
\usage{
plotNorm(DGEdata, plotType = "box", normalize = "tmm")
}
\arguments{
\item{DGEdata}{A DGEobj or counts matrix.}

\item{plotType}{One of "box" or "density." (Default = "box")}

\item{normalize}{Default = "TMM" and invokes TMM normalization. Other allowed
values are: "RLE", "upperquartile", or "none". Invokes edgeR::calcNormFactors for
normalization.}
}
\value{
A faceted ggplot plot showing before/after log2CPM normalization.
}
\description{
Takes a DGEobj containing counts or a counts matrix as input. Returns a ggplot object containing
a faceted plot of log2CPM before and after normalization. Either a box plot or density plot
type can be chosen.
}
\details{
Normalization is performed by edgeR::calcNormFactors. Note TMM is specifically tailored to count-based
data.  Thus this function is only appropriate for count-based data.
}
\examples{
\dontrun{
   myNormPlotBox <- plotNorm(myDGEobj, plotType = "box")
   myNormPlotDensity <- plotNorm(counts, plotType = "density")
}

}
