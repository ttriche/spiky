% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scan_genomic_contigs.R
\name{scan_genomic_contigs}
\alias{scan_genomic_contigs}
\title{scan genomic contigs in a BAM/CRAM file}
\usage{
scan_genomic_contigs(bam, spike, param = NULL, ...)
}
\arguments{
\item{bam}{the BAM or CRAM filename, or a vector of them}

\item{spike}{the spike-in reference database (e.g. data(spike))}

\item{param}{a ScanBamParam object specifying which reads to count (NULL)}

\item{...}{additional arguments to pass to scanBamFlag()}
}
\value{
\preformatted{     a CompressedGRangesList with bin- and spike-level coverage
}
}
\description{
The default workflow for spiky is roughly as follows:
}
\details{
\enumerate{
\item Identify and quantify the spike-in contigs in an experiment.
\item Fit a model for sequence-based abundance artifacts using the spike-ins.
\item Quantify raw fragment abundance on genomic contigs, and adjust per step 2.
}

scan_genomic_contigs addresses the first half of step 3. The assumption is
that anything which isn't a spike contig, is a genomic contig.  This isn't
necessarily true, so the user can also supply a ScanBamParam object for the
\code{param} argument and restrict scanning to whatever contigs they wish, which
also allows for non-default MAPQ, pairing, and quality filters.

If multiple BAM or CRAM filenames are provided, all indices will be
checked before attempting to run through any of the files.
}
\examples{

library(Rsamtools)
data(spike, package="spiky")

fl <- system.file("extdata", "ex1.bam", package="Rsamtools", 
                  mustWork=TRUE)
scan_genomic_contigs(fl, spike=spike) # will warn user about spike contigs

sb <- system.file("extdata", "example.spike.bam", package="spiky",
                  mustWork=TRUE)
scan_genomic_contigs(sb, spike=spike) # will warn user about genomic contigs

}
\seealso{
\preformatted{    Rsamtools::ScanBamParam
}
}
