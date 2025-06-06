% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/diff.R
\name{calcSmoothedWindows}
\alias{calcSmoothedWindows}
\title{calcSmoothedWindows}
\usage{
calcSmoothedWindows(
  obj,
  type = "CG",
  threads = 1,
  step = 500,
  smooth = 3,
  genome = "hg38",
  index = "chr_cg",
  futureType = "multicore",
  groupBy = "cluster_id",
  returnSumMatrix = TRUE,
  returnPctMatrix = TRUE
)
}
\arguments{
\item{obj}{Amethyst object containing the path(s) to calculate.}

\item{type}{Type of methylation - e.g. "CG" or "CH" - to calculate. Typically will be "CG."}

\item{threads}{Optional number of threads for parallelization. Basically required for this step.}

\item{step}{Width of the genomic window to calculate. Default is 500 bp.}

\item{smooth}{Number of windows to include surrounding the target region; i.e. produces a sliding window matrix.
Default parameter is 3, resulting in a 1500 x 500 bp sliding window matrix.}

\item{genome}{Genome build of the organism(s) being analyzed. Options are currently "hg19", "hg38", "mm10", or "mm39".}

\item{index}{Name of chr index in the index slot.
This reduces memory constraints by processing one chromosome at a time.}

\item{futureType}{If using parallelization, should R multithread using "multicore" or "multisession".}

\item{groupBy}{Parameter contained in the metadata over which to aggregate observations. Default is "cluster_id".}

\item{returnSumMatrix}{Whether or not the function should return the matrix of summed c and t observations. Required for testDMR input.}

\item{returnPctMatrix}{Whether or not the function should calculate \% methylation over each genomic window. Required for heatMap input.}
}
\value{
if returnSumMatrix = TRUE, returns a data.table with the genomic location as chr, start, and end columns,
plus aggregated c and t observations for each groupBy value. If returnPctMatrix = TRUE, returns a data.table with the
genomic location as chr, start, and end columns, plus one column of the mean \% methylation for each window per groupBy value.
If both are true, returns a list containing each result.
}
\description{
Aggregate c and t observations over smoothed genomic windows of a user-defined size.
Optionally calculate the \% methylation for each window.
}
\examples{
output <- calcSmoothedWindows(obj, returnSumMatrix = TRUE, returnPctMatrix = FALSE) # example to calculate testDMR input
output <- calcSmoothedWindows(obj, returnSumMatrix = FALSE, returnPctMatrix = TRUE) # example to calculate heatMap input
}
