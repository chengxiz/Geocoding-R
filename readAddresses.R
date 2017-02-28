readAddresses <- function(infile){
  data <- read.csv(paste0('../Files/', infile, '.csv'))
  data.fr <- as.data.frame(data)
  data.fr$Venue.name <- as.vector(data.fr$Venue.name)
  data.fr$Address <- as.vector(data.fr$Address)
  return(data.fr)
}