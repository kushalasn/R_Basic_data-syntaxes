#LOAD DATA
x=c(24,13,7,5,3,2)
barplot(x)

#colors in R
?colors
colors()

#USING COLORS FOR PLOTTING/VISUALIZATION
barplot(x,col="red3") #red3
barplot(x,col="slategray3") #slategray3

#RGB TRIPLETS(0.00-1.00)
barplot(x,col=rgb(0.80,0,0)) #red3
barplot(x,col=rgb(0.62,0.71,0.80)) #slategray3

#RGB TRIPLETS(0-255)
barplot(x,col=rgb(205,0,0,max=255)) #red3
barplot(x,col=rgb(159,182,205,max=255)) #slategray3

#HEXCODES ALSO ENCOURAGED
#MULTIPLE COLORS
barplot(x,col=c("red3","slategray3"))
barplot(x,col=c("#9FB6CD","#CD0000"))

#USING COLOR PALETTES
?palette
palette()
barplot(x,col=1:6)   #USE CURRENT PALETTE
barplot(x,col=rainbow(6))   #RAINBOW
barplot(x,col=terrain.colors(6))   #TERRAIN
barplot(x,col=topo.colors(6))   #PURPLE THROUGH TAN


#CLEAN UP
#Clear Environment
rm(list=ls())
