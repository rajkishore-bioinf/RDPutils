make_otu_names <-
function(otu_nums) {
  n <- nchar(as.character(max(otu_nums)))
  new.clstr.name <- matrix("",length(otu_nums),1)
  for (i in 1:length(otu_nums)) {
    k <- nchar(as.character(otu_nums[i]))
    k <- n-k
    if (k==0) {pad<-""} else {
      pad <- ""
      for (j in 1:k) {
        pad <- ""
        for (j in 1:k){
          pad <- paste(pad, "0", sep="")
        }
      }
    }
    new.clstr.name[i,1] <- paste("OTU_", pad, as.character(otu_nums[i]), sep="")
  }
  return(new.clstr.name)
}