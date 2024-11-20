OreoData <- read.table(
  file =
    "https://raw.github.com/neilhatfield/STAT461/master/dataFiles/classDemoOreo.dat",
  header = TRUE,
  sep = ","
)

str(OreoData)
View(OreoData)

OreoData$Filling.Mass
OreoData$Type
OreoData$Filling.Mass[46]

OreoData[1:3,2]
OreoData[1:3,"Type"]
OreoData[c(2,6,10:15), "Filling.Mass"]
OreoData[60, "Type"] <- "Mega"
OreoData[60, "Type"]

RegularOreosData <- OreoData[OreoData$Type == "Regular",]
View(RegularOreosData)

install.packages("dplyr")
library(dplyr)
ChainRegularOreosData <- OreoData %>%
  filter(Type=="Regular") %>%
  filter(Filling.Mass > 3)
View(ChainRegularOreosData)
