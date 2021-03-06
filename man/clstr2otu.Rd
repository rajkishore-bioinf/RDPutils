\name{clstr2otu}
\alias{clstr2otu}

\title{
Create an OTU Table from a Cluster File
}
\description{
Parses a cluster file into an otu table with samples as rows and OTUs as columns.  The input cluster file can contain data for more than one distance, or for a single distance.  This function provides the same result as RDP's R-formatter, but for only one distance.  If OutFile=TRUE, then the function also writes a cluster file for distance = dist to file.name.

}
\usage{
clstr2otu(clstr_file = "all_seq_complete.clust", dist = 0.03, OutFile = FALSE, file_name = "dist_03.clust", otu_format="R")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{clstr_file}{
The output file given by RDP's cluster tool.  This file usually contains cluster information for more than one distance.
}
  \item{dist}{
dist is the maximum distance between sequences in the same cluster.  An OTU table will be created for the distance given here, which must be present in the cluster file.
}
  \item{OutFile}{
A logical.  If OutFile is TRUE, then a cluster file is written to disk for the single distance given by dist.  Default = FALSE.
}
  \item{file_name}{
The name of the cluster file written to disk if OutFile is TRUE.  Otherwise ignored.
}
  \item{otu_format}{
When equal to "R" (default) OTU names have the form "OTUxxxnn."  When equal to "biom", OTU names have the form "cluster_nn."
}
}
\details{
This function can take several minutes, depending on the number of OTUs and samples.  The cluster file for a single distance output by the function can be used to associate the OTU names in the OTU table produced with the representative sequence machine names.

The sample names are shortened by removing common prefixes and suffixes introduced by RDP's tools.  These include "nc_", "aligned_", "_trimmed", ".fasta" and ".fastq."

The two OTU formats correspond to those output by the RDP's cluster file formatter, which has the options "R"" and "biom."  With option "R," OTU names begin with "OTU" and are padded to equal length with leading zeros, e.g. "OTU00067."  Thus they can be sorted in numerical order.  With option "biom," OTU names begin with "cluster_" and are not padded with leading zeros, e.g "cluster_67." 
}
\value{
Returns a numerical data frame, or OTU table, where samples are rows and OTUs are columns.  This is the convention used by vegan.  To import the result into phyloseq, it should first be transposed and converted to class matrix.

}
\references{
RDP web-based clustering services and tutorials on clustering sequence data are available at: http://rdp.cme.msu.edu/

RDPTools is an open source package available from https://github.com/rdpstaff; it includes a command line function for clustering, necessary for data sets too large to process with the web-based clustering tool.

Cole, J. R., Q. Wang, J. A. Fish, B. Chai, D. M. McGarrell, Y. Sun, C. T. Brown, A. Porras-Alfaro, C. R. Kuske, and J. M. Tiedje. 2014. Ribosomal Database Project: data and tools for high throughput rRNA analysis Nucl. Acids Res. 41(Database issue):D633-D642; doi: 10.1093/nar/gkt1244 [PMID: 24288368]
}
\author{
John Quensen
}

\examples{

clstr.file <- system.file("extdata", "all_seq_complete.clust", package="RDPutils")
otu <- clstr2otu(clstr_file=clstr.file, dist=0.03, OutFile=TRUE, file_name= "dist_03.clust")
otu[ , 1:5]
}

\keyword{RDPTools}

