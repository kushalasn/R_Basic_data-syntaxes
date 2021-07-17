# setup and libraries
library(magrittr) #for piping
library(lubridate)# for smooth operation with dates and times
library(dplyr)

df <- read.table("C:/Users/kushal/Documents/Environmental_Data_Deep_Moor_2012.txt",sep = "", dec = ".")
df
datapath <- ("C:/Users/kushal/Documents/Environmental_Data_Deep_Moor_2012.txt")

readonefile <- function(datapath)
{
  read.table(datapath, header = TRUE,,sep = "", dec = ".",
             stringsAsFactors = FALSE)
}
readonefile("C:/Users/kushal/Documents/Environmental_Data_Deep_Moor_2012.txt")
 myProgressBar <- txtProgressBar(min = 2012, max = 2015, style = 3)

for (datayear in 2012:2015) {
  
  datapath <-
    paste0(
      "https://raw.githubusercontent.com/lyndadotcom/LPO_weatherdata/master/Environmental_Data_Deep_Moor_",
      datayear,
      ".txt"
    )
  
  if (exists("LPO_weather_data")) {
    mytempfile <- readonefile(datapath)
    LPO_weather_data <- rbind(LPO_weather_data, mytempfile)
  } else {
    LPO_weather_data <- readonefile(datapath)
  }
  setTxtProgressBar(myProgressBar, value = datayear)
  
}
head(LPO_weather_data, n = 3)
 tail(LPO_weather_data,n=3)
 print(nrow(LPO_weather_data))


#calculating the coeff of Barometric Pressure
# #Beginning and End time
 startDateTime <- "2014-01-02 12:03:34"
 endDateTime <- "2014-01-04 12:03:34"
#
 getBaromPressure <- function(datetimeinterval)
 {
   subset(LPO_weather_data,ymd_hms(paste(date,time)) %within% datetimeinterval,select=c(Barometric_Press,date,time))
 }


 calculatebaropress <- function(startDateTime,endDateTime)
 {
   datetimeinterval <- interval(ymd_hms(startDateTime),ymd_hms(endDateTime))
   baropress=getBaromPressure(datetimeinterval)

   slope <- ymd_hms(paste(baropress$date,baropress$time))
   lm(Barometric_Press~slope,data=baropress) #Tilde operator is used to define the relationship between dependent variable and independent variables in a statistical model formula. The variable on the left-hand side of tilde operator is the dependent variable and the variable(s) on the right-hand side of tilde operator is/are called the independent variable(s)
 }
 calculatebaropress(startDateTime,endDateTime)



graphbaropressure <- function(startDateTime,endDateTime)
{
datetimeinterval <- interval(ymd_hms(startDateTime),ymd_hms(endDateTime))
baropress <- getBaromPressure(datetimeinterval)
filtereddatetime <- ymd_hms(paste(baropress$date,baropress$time))
plot(
     x=filtereddatetime,
     y=baropress$Barometric_Press,
     xlab="Date and Time",
     ylab="Biometric Pressure",
     main=paste("Biomeetric Pressure from",ymd_hms(startDateTime),"to",ymd_hms(endDateTime))

   )
   abline(calculatebaropress(startDateTime,endDateTime),col="red") #DOUBT SECTION
 }
 graphbaropressure(startDateTime ,endDateTime)

 