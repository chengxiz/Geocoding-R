updateAddress <- function(data.fr.um){
  iii <- 1
  while(iii<=nrow(data.fr.um)){
    name.sep <- strsplit(data.fr.um$Address[iii], ",")
    name.1 <- paste(name.sep[[1]][1], "Road", collapse = '\n')
    name.2 <- paste(name.1,name.sep[[1]][2], sep = ', ')
    data.fr.um$Address[iii] <- name.2
    iii <- iii+1
  }
  return(data.fr.um)
}
