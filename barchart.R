#INSTALL AND LOAD PACKAGES
#pacman-a highly used package
pacman::p_load(pacman,tidyverse)

#LOAD DATA
#using the diamonds dsataset from ggplot2

?diamonds #get information about the dataset
diamonds #display the beginning of the dataset
plot(diamonds$cut)

#similar process using the pipes
diamonds %>%
  select(color) %>%
  plot()

#create frequency vector with table()

?table

diamonds %>%
  select(clarity) %>% #ORDINAL
  table()%>%
  barplot()


diamonds %>%
  select(color) %>%       #NOMINAL
  table()%>%
  sort(decreasing = T)%>%
  barplot()

#ADD OPTIONS TO PLOT
diamonds%>%
  select(clarity)%>%
  table() %>% #put data in the appropriate format
  barplot(
  main="Clarity of Diamonds",
  sub="ggplot2 source",
  horiz=T,
  ylab="Clarity of Diamonds",
  xlab='Frequency',
  xlim=c(0,15000),
  border=NA,
  col="#CD0000" #red3
  )
  
#stacking bars could be worked at a later point

?hist
#histogram with defaults
hist(diamonds$price)

#histogram with options
hist(diamonds$price,
     breaks=7, #suggested number of breaks ie the number of bars
     main="Histogram of Price of Diamonds",
     sub=("ggplot2 diamonds"),
     ylab='Frequency',
     xlab='Price of Diamonds',
     border=NA,
     col="#CD0000")
#Boxplot using the pipes
diamonds %>%
  select(price)%>%
  boxplot()

#Boxplot with options
diamonds %>%
  select(price)%>%
  boxplot(horizontal=T,                         #Horizontal
  notch=T,                                      #confidence interval for median
  main="Boxplot of Price of Diamonds",
  sub="(ggplot2 diamonds)",
  xlab="Price of Diamonds",
  col="#CD0000" #red3)
)

#boxplot using plot
diamonds %>%
  select(color,price)%>%
  plot()


#boxplots by group using boxplot
diamonds %>%
  select(color,price)%>%
  boxplot(
    price~color,
    data=.,
    col="#CD0000"
  )

#clean up
rm(list=ls())



#installing packages and loading the packages,dataset

pacman::p_load(pacman,rio,tidyverse)

#LOAD AND PREPARE DATA
df<-import("C:/Users/kushal/Desktop/LeetCode-Files/R/Ex_Files_Learning_R/Exercise Files/data/StateData.xlsx") %>%
  as_tibble()%>%
  select(state_code,
         psychRegions,
         instagram:modernDance)%>%
  mutate(psychRegions=as.factor(psychRegions))%>%
  print()

#SCATTERPLOT
df %>%
  select(instagram:modernDance)%>%
  plot() #plot all associations

df%>%
  select(scrapbook:modernDance)%>%
  plot()

?pch

df%>%
  lm(modernDance~scrapbook,data=.)%>%
  abline()


#REMOVE OUTLIER
#IDENTIFY THE OUTLIER
df%>%
  select(state_code,scrapbook)%>%
  filter(scrapbook>4)%>% #filter out the outlier
  print()
  
#Bivariate scatterplot without the outlier
df %>%
  select(state_code,scrapbook) %>%
  filter(scrapbook < 4) %>% #filter out the outlier
  plot(
    main="Scatterplot of Google Searches by State",
    xlab="Searches for scrapbook",
    ylab="Searches for modern Dance",
    col="gray",
    pch=20,
    
  )

df%>%
  select(instagram)%>%
         plot()





########## LINE CHARTS #######################
pacman::p_load(pacman,tidyverse)
library(datasets)
?datasets
library(help = "datasets")

uspop
?uspop  

?ts
plot(uspop)

uspop%>%
  plot(
    main="US population 1790-1970",
    sub="source datatsets:: uspop",
    xlab="year",
    ylab="population in millions",
    
  )
  abline(h=190,col="lightgray")
?ts.plot

plot(EuStockMarkets)         

ts.plot(EuStockMarkets)
abline(v=1996)


##### CREATING CLUSTER CHARTS ######
df<-import("C:/Users/kushal/Desktop/LeetCode-Files/R/Ex_Files_Learning_R/Exercise Files/data/StateData.xlsx")%>%
  as.tibble()%>%
  select(state_code,
         psychRegions,
         instagram:modernDance)%>%
  mutate(psychRegions=as.factor(psychRegions))%>%
  rename(y=psychRegions)%>%
  print()

         

#ANALYZE THE DATA
hc<-df %>% #GET DATA
  dist%>%  #COMPUTE DISTANCE/DISSIMILARITY MATRIX
  hclust   #HIERARCHICAL CLUSTERING

#PLOT DENDOGRAM
hc %>% 
  plot(labels=df$state_code)

#DRAW BOXES AROUND CLUSTERS
hc %>%
  rect.hclust(k=2,border="gray80")
hc %>%
  rect.hclust(k=3,border="gray80")
hc %>%
  rect.hclust(k=4,border="gray80")

diamonds %>%
  select(clarity)%>%
  sort(decreasing = T) %>%
  table() %>%
  barplot()             


#LOADING AND PREPARING DATA
pacman::p_load(pacman,rio,tidyverse)
df<-import("C:/Users/kushal/Desktop/LeetCode-Files/R/Ex_Files_Learning_R/Exercise Files/data/StateData.xlsx")%>%
  as_tibble()%>%
  select(state_code,region,psychRegions,instagram:modernDance)%>%
  mutate(psychRegioons=as.factor(psychRegions))%>%
  print()

#FILTER BY ONE VARIABLE
# "entrepreneur" is a quantiative variable
df %>%
  filter(entrepreneur>1)%>%
  print()

#"region" is a character variable
df%>%
  filter(region=="South")%>%
  print()

#"psychRegions" is a factor
df %>%
  filter(psychRegions=="Relaxed and Creative") %>%
  print()
#FILTER BY MULTIPLE VARIABLES
# "or" is the vertical pipe
df%>%
  filter(region=="South" | psychRegions=="Relaxed and Creative")%>%
  print()

#"and" is the ampersand
df%>%
  filter(region=="South" & psychRegions=="Relaxed and Creative") %>%
  print()
 
#"and" is the exclamation point!
df%>%
  filter(region=="South" & psychRegions=="Relaxed and Creative")
# "not" is the exclamation point!
df%>%
  filter(region=="South" & !psychRegions=="Relaxed and Creative")%>%
  print()
df$region<-recode(df$region,"c('South')='South' ")


#COMBINE CATEGORIES WITH  RECODE
df%>%
  mutate(relaxed=recode(psychRegions,"Relaxed and Creative"="yes","Friendly and Conventional"="no",.default="no"))%>%
  select(state_code,psychRegions,relaxed)


  