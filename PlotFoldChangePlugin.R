### R code from vignette source 'EBSeq_Vignette.Rnw'

###################################################
### code chunk number 1: EBSeq_Vignette.Rnw:172-173
###################################################
library(EBSeq)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}


run <- function() {}

output <- function(outputfile) {
	EBOut <- readRDS(paste(pfix, parameters["empirical", 2], sep="/"))
	GeneFC <- readRDS(paste(pfix, parameters["genefc", 2], sep="/"))
        pdf(outputfile)
	PlotPostVsRawFC(EBOut,GeneFC)
}

