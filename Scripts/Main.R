source("getGeoDetails.R")
source("readAddresses.R")
source("checkTempFiles.R")

# get the input data
infile <- "Home_Addresses"
data.fr <- readAddresses(infile)
addresses = data.fr$Address
#initialise a dataframe to hold the results
geocoded <- data.frame()
# find out where to start in the address list (if the script was interrupted before):
startindex <- 1
# check temp files
r.list <- checkTempFiles(infile, geocoded, startindex)
geocoded <- r.list[[1]]
startindex <- as.double(r.list[[2]])
tempfilename <- as.character(r.list[[3]])

# geocode() function takes care of query speed limit.
for (ii in seq(startindex, length(addresses))){
  print(paste("Working on index", ii, "of", length(addresses)))
  #query the google geocoder - this will pause here if we are over the limit.
  result = getGeoDetails(addresses[ii]) 
  print(result$status)     
  result$index <- ii
  #append the answer to the results file.
  geocoded <- rbind(geocoded, result)
  #save temporary results as we are going along
  saveRDS(geocoded, tempfilename)
}
data.fr.geocoded <- as.data.frame(geocoded)
# check unmatch data 
data.fr.um <- data.fr[geocoded$status=="Mismatch",]

data.fr.geocoded <- cbind(data.fr.geocoded, data.fr$Venue.name)
filename.geocoded <- paste("../Files/geocoded_",infile,".csv",sep="")
write.csv(data.fr.geocoded, file=filename.geocoded, row.names=FALSE)
filename.mismatch <- paste("../Files/mismatch_",infile,".csv",sep="")
write.csv(data.fr.um, file=filename.mismatch, row.names=TRUE)
