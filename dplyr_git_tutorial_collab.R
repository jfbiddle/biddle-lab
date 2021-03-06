#dplyr and Git beginner tutorial
#University of Delaware
#Last updated: September 7, 2015
#COLLABORATIVE

# ____  _     _     _ _        _           _     
# |  _ \(_)   | |   | | |      | |         | |    
#   | |_) |_  __| | __| | | ___  | |     __ _| |__  
# |  _ <| |/ _` |/ _` | |/ _ \ | |    / _` | '_ \ 
# | |_) | | (_| | (_| | |  __/ | |___| (_| | |_) |
# |____/|_|\__,_|\__,_|_|\___| |______\__,_|_.__/       

#GitHub repository URL: https://github.com/IMRambo/biddle-lab.git
#==============================================================================
#GOAL: learn how to use dplyr functions for data wrangling.
#Combine dplyr, tidyr, and ggplot functions.
#Collaborate on this script using Git.
#==============================================================================
library(plyr)
library(dplyr)
library(ggplot2)
library(grid)
library(tidyr)
library(vegan)
#==============================================================================
#setwd("/Users/imrambo/Documents/Git/biddle-lab/")
#Load the hflights dataset - all flights departing from Houston in 2011 
library(hflights)

#Display header and first four rows of hflights
head(hflights, n = 4)
dim(hflights)
str(hflights)

#Carrier names, some real, most fake and/or goofy.
CarrierName <- c("American Airlines", "Lufthansa", "Fly Like a B6",
                 "Colorado Air", "HushHush Air", "Flying Monkey Air",
                 "Uzbekistan Airlines","US Air", "Windy Air", "Evil Air",
                 "FinnAir", "Soul Plane","Air Morocco",
                 "Xenophobic International", "Air Yugoslavia")
#Unique values of Houston carrier codes; pair with CarrierName vector
UniqueCarrier <- unique(hflights$UniqueCarrier)
#Create a data frame of character vectors containing "airline names" and
#carrier codes.
Carriers <- data.frame(CarrierName, UniqueCarrier)
Carriers$CarrierName <- as.character(CarrierName)
Carriers$UniqueCarrier <- as.character(UniqueCarrier)
str(Carriers)
#==============================================================================
#Let's make use of dplyr's %>% operator, which allows us to chain
#operations together. Combo attack!
hflights %>%
