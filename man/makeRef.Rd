% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prepare.R
\name{makeRef}
\alias{makeRef}
\title{makeRef}
\usage{
makeRef(genome, gtf = NULL, attributes = c("gene_name", "exon_number"))
}
\arguments{
\item{genome}{Reference genome, e}

\item{gtf}{If not using hg19, hg38, mm10, or mm39, please provide the gtf.gz file path}

\item{attributes}{Information to extract from the gtf file. Must be a column name}
}
\value{
Returns an annotated reference of gene locations
}
\description{
Generate an genome annotation file.
}
\examples{
ref <- makeRef(genome = "hg38")
}
