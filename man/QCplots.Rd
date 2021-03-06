% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/QCplots.R
\name{QCplots}
\alias{QCplots}
\title{Create QC metric plots}
\usage{
QCplots(
  qcdata,
  metricNames,
  sampleNames,
  plotType = "bar",
  barColor = "dodgerblue4",
  barFill = "dodgerblue3",
  barSize = 0.1,
  barAlpha = 1,
  barWidth = 0.9,
  pointColor = "dodgerblue4",
  pointFill = "dodgerblue3",
  pointShape = 21,
  pointAlpha = 1,
  pointSize = 4,
  lineColor = "dodgerblue4",
  lineSize = 1,
  lineType = "solid",
  lineAlpha = 1,
  histColor = "dodgerblue4",
  histFill = "dodgerblue3",
  histSize = 1,
  histAlpha = 1,
  xAngle = 90,
  baseTextSize = 14,
  hlineSD = 3,
  winsorize = TRUE
)
}
\arguments{
\item{qcdata}{A dataframe with metric names in the first column and
samples in columns 2-n.  Each row is a different QC metric. (Required)}

\item{metricNames}{A list of metrics to plot.  Values must exist in column 1
of the data frame. (Required)}

\item{sampleNames}{By default will use the sample names in qcdata (colnames).
Optionally use this argument to provide different sample names.  Supply the
alternative sample names here in the order they appear in the qcdata
data.frame (columns 2-n). The plot order is based on an alphabetical sort
of the original column names so might be different from the order in the
supplied data.frame.}

\item{plotType}{One of "bar", "point", "pointline".  For a different
plot type for each metric, pass a list of plotTypes with length equal to
length(metricNames). (Default = "bar")}

\item{barColor}{Color for the bar outline (Default = "dodgerblue4")}

\item{barFill}{Color for the bar area (Default = "dodgerblue3")}

\item{barSize}{Set the bar size (thickness of each bar perimeter; Default =
0.1)}

\item{barAlpha}{Transparency for the bar layer (Range = 0-1) (Default = 1)}

\item{barWidth}{Set the bar width (Default = 0.8)}

\item{pointColor}{Color for the point layer (Default = "grey30")}

\item{pointFill}{Fill color for the point layer (Default = "dodgerblue4")}

\item{pointShape}{Shape for the point layer (Default = 21; fillable circle)}

\item{pointAlpha}{Transparency for the box layer (Range = 0-1) (Default = 1)}

\item{pointSize}{Size of the points (Default = 4)}

\item{lineColor}{Color of the line (Default = "dodgerblue4")}

\item{lineSize}{Size of the line fit (Default = 1)}

\item{lineType}{One of c("solid", "dashed", "dotted", "dotdash", "longdash",
"twodash"). (Default = "solid")}

\item{lineAlpha}{Transparency for the line layer (Range = 0-1) (Default=1)}

\item{histColor}{Outline color for the histogram (Default = "dodgerblue4")}

\item{histFill}{Fill color for the histogram (Default = "dodgerblue3")}

\item{histSize}{Thickness of the bar borders (Default = 1)}

\item{histAlpha}{Transparency of the histogram (Default = 1)}

\item{xAngle}{Angle to set the sample labels on the X axis (Default = 90;
Range = 0 - 90)}

\item{baseTextSize}{Default = 14}

\item{hlineSD}{Draw two reference lines 1) at the median value 2) the number of
SDs defined by the value of hlineSD. (Default = 3; 0 to disable the reference lines.)}

\item{winsorize}{This implements a robust method to calculate standard
deviations.  It is used to calculate the standard deviation for the
placement of horizontal reference lines (hlineSD argument).  The adaptive
winsorization used here only trims extreme values when normality is
violated. see https://www.r-bloggers.com/winsorization/ for details.
(Default = TRUE).}
}
\value{
ggplot object if one plot is specified.  A list of ggplot objects if 2 or more metrics specified.
}
\description{
Takes a dataframe with metric names in the first column and
samples in the second through nth column.  Each row is a different QC metric.
Returns a list of QC plots as defined by other arguments.  If only one metric is plotted,
a ggplot object is returned. By default, horizontal reference lines are drawn
at the median and +/- n SDs based on the hlineSD argument. These are
statistical reference points, NOT pass/fail limits.
}
\examples{
\dontrun{
  someFaveMetrics <- c("Alignment_MappedRate", "Alignment_PairedRate",
                              "Source_rRNA", "Strand_Read1AntiSense",
                              "Strand_ReadPairAntiSense", "Profile_ExonRate",
                              "Profile_InterGene_FPK")

  MyQCplots <- QCplots(qcdata, metricNames = someFaveMetrics) # All defaults

  # Draw the first plot
  print(MyQCplots[[1]])
}

}
