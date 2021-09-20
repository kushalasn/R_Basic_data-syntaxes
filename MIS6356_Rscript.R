
library(arules)
fp.df <- read.csv("transaction.csv")
fp.df
fp.df1<-fp.df[,-1]

# remove first column and convert to matrix
fp.mat <- as.matrix(fp.df1) 

#transactions cannot be retrieved directly from dataframe to binary, rather use a matrix form
# convert the binary incidence matrix into a transactions database

fp.trans <- as(fp.mat, "transactions")
head(fp.trans)
inspect(fp.trans)
support(fp.df$Transaction)

# plot data
itemFrequencyPlot(fp.trans,type='absolute')

## get rules
# when running apriori(), include the minimum support, minimum confidence, and target
# as arguments. 
rules <- apriori(fp.trans, parameter = list(supp = 0.01, conf = 0.1, target = "rules",minlen=2))
inspect(rules)
class(rules)


# inspect the first six rules, sorted by their lift
inspect(rules)
top10subRules <- head(rules, n = 10, by = "lift")
inspect(head(top10subRules))
table(fp.df$Toothbrush,fp.df$Bow)
length(which(fp.df$Toothbrush!=0))/length(fp.df)
length(which(fp.df$Toothbrush!=0))/length(fp.df$Transaction)

#visualizing the rules

install.packages("arulesViz")
library(arulesViz)
subRules<-rules[quality(rules)$confidence>0.1]
#Plot SubRules
plot(subRules)
top10subRules <- head(subRules, n = 10, by = "confidence")
plot(top10subRules, method = "graph",  engine = "htmlwidget")
library(plyr)
count(fp.df$Bow)
length(which(fp.df$Toothbrush!=0 & fp.df$Bow!=0)) / length(which(fp.df$Transaction!=0))
length(which(fp.df$Toothbrush!=0))/nrow(fp.df)









