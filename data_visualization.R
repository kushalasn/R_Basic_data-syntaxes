#INSTALL AND LOAD PACKAGES########
#load base packages manually

library(datasets)
#LOAD AND PREPARE DATA
?iris
df<-iris
head(iris)
hist(df$Sepal.Width,main = "Histogram of Petal Width",xlab='Sepal Width in (cm)')

#Install pacman ("package manager") if needed
if(!require("pacman")) install.packages("pacman")

pacman::p_load(pacman,party,psych,rio,tidyverse)
update.packages()

#load base packages manually
library(datasets)
iris%>%
  subset(Sepal.Length>5)%>%
  aggregate(.~Species,.,median)
x <- c(0.109, 0.359, 0.63, 0.996, 0.515, 0.142, 0.017, 0.829, 0.907)
round(exp(diff(log(x))),1)


UCBAdmissions %>%
  margin.table(3) %>%
  prop.table %>%
  round(2) %>%
  multiply_by(100)

#sapmple piping example in r
three(two(one(data,a),b),c)
data %>%
  one(a) %>%
  two(b) %>%
  three(c)

?Titanic
Titanic

library(datasets)
?datasets
library(help="datasets")

?Titanic
Titanic








#Importing csv files with readr from tidyverse
(df<-read_csv('C:/Users/kushal/Desktop/LeetCode-Files/R/Ex_Files_Learning_R/Exercise Files/data/StateData.csv'))
(df<-import('C:/Users/kushal/Desktop/LeetCode-Files/R/Ex_Files_Learning_R/Exercise Files/data/StateData.xlsx') %>% as_tibble())
