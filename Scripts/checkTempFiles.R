checkTempFiles <-function(infile, geocoded, startindex){
  #if a temp file exists - load it up and count the rows!
  tempfilename <- paste0(infile, '_temp_geocoded.rds')
  if (file.exists(tempfilename)){
    print("Found temp file - resuming from index:")
    geocoded <- readRDS(tempfilename)
    startindex <- nrow(geocoded)
    print(startindex)
  }
  return(list(geocoded, startindex,tempfilename))
}