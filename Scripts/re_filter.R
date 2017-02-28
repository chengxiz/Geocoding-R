data <- read.csv('../Files/geocoded_unfiltered_Home_Addresses.csv')
home.addresses <- read.csv('../Files/Home_Addresses.csv')

data.filtered <- home.addresses[is.na(data$formatted_address),]

write.csv(data.filtered, file='../Files/mismatch_unfound_Home_Addresses.csv', row.names=TRUE)
data.updated <- data[!is.na(data$formatted_address),]
write.csv(data.updated, file='../Files/geocoded_Home_Addresses.csv', row.names=TRUE)
