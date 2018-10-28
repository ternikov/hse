# Workshop 1
# Collect and Visualize Salary Data

##############
# First Part #
##############

# Collect data from Salary Data & Career Research Center (United States)
# Extract map with data (*.json format)
#install.packages('XML')
library(XML)
dat <- htmlParse(readLines('https://www.payscale.com/research/US/Country=United_States/Salary', warn = F))
jdat <- xpathSApply(dat, '//input[@id="jobData"]', xmlGetAttr, 'value')

# Convert *.json to table
#install.packages('jsonlite')
library(jsonlite)
jtab <- fromJSON(jdat)

# Link to profession in state
df <- readHTMLTable(readLines('https://www.payscale.com/research/US/Job=Accountant/Salary/3be1834a/Boston-MA', warn = F))

# Male and Women
df[[4]]$V3[1]
df[[4]]$V3[2]

# Cycle it (est.time 40sec)
for (i in 1:nrow(jtab)){
  url <- paste0('https://www.payscale.com', jtab$Url[i])
  df <- readHTMLTable(readLines(url, warn = F))
  jtab[i, 12] <- as.character(df[[4]]$V3[1])
  jtab[i, 13] <- as.character(df[[4]]$V3[2])
}

# Show and exclude 6th line (just no info)
i = 6
url <- paste0('https://www.payscale.com', jtab$Url[i])
jtab <- jtab[-6,]

# Convert male/female amount to numbers
colnames(jtab)[12:13] <- c('male', 'female')

jtab$male <- as.numeric(gsub(',', '', unlist(strsplit(jtab$male, ' '))[seq(1, 38, 2)]))
jtab$female <- as.numeric(gsub(',', '', unlist(strsplit(jtab$female, ' '))[seq(1, 38, 2)]))

# Summary statistics for data.frame
summary(jtab)

###############
# Second Part #
###############

# Google maps (Developers console)
# Google Places API
# Find the top ranked museum in the area
apikey <- 'paste_your_api_key'
url <- paste0('https://maps.googleapis.com/maps/api/place/textsearch/json?query=museum&location=',
       jtab$Lat[i], ',', jtab$Lng[i], '&radius=50&&key=',apikey)

gstr <- readLines(url, warn = F)
out <- fromJSON(gstr)
out <- out[[3]]
out2 <- out[order(-out$rating),]
out2$name[1]

# Cycle finding (est.time 30 sec.)
for (i in 1:nrow(jtab)){
  url <- paste0('https://maps.googleapis.com/maps/api/place/textsearch/json?query=museum&location=',
                jtab$Lat[i], ',', jtab$Lng[i], '&radius=50&&key=',apikey)
  gstr <- readLines(url, warn = F)
  out <- fromJSON(gstr)
  out <- out[[3]]
  out2 <- out[order(-out$rating),]
  jtab[i, 14] <- out2$name[1]
}

colnames(jtab)[14] <- 'topmuseum'

# Dynamic visualisation
# Numeric coordinates
jtab$Lat <- as.numeric(jtab$Lat)
jtab$Lng <- as.numeric(jtab$Lng)

# Create *.html map
#install.packages('leaflet')
library(leaflet)
leaflet() %>% addTiles() %>% 
  addCircleMarkers(jtab$Lng, jtab$Lat, 
                   label = jtab$DisplayLocation,
                   popup = paste(jtab$Name, '</br>', 'Median Pay:', jtab$MedianPayStr,
                                 '</br>Top Museum:', jtab$topmuseum))