#Data Types
n1<-15    #double precision by default
n1
typeof(n1)

n2<-1.5    #double precision by default
n2
typeof(n2)

c1<-"c"
typeof(c)

l1=TRUE
l1
typeof(l1)

c2<-"a string of text"
c2
typeof(c2)

#DATA STRUCTURES
#vectors
v1<-c(1,2,3,4,5)
v1

v2<-c('a','b','c')
v2
is.vector(v2)

v3<-c(TRUE,TRUE,FALSE,FALSE,FALSE,TRUE)
v3
is.vector(v3)

#matrix
#DATA STRUCTURES
#vectors
v1<-c(1,2,3,4,5)
v1

v2<-c('a','b','c')
v2
is.vector(v2)

v3<-c(TRUE,TRUE,FALSE,FALSE,FALSE,TRUE)
v3
is.vector(v3)
#DATAFRAME
vn<-c(1,2,3)
vc<-c('a','b','c')
vl<-c(T,F,T)
df1<-cbind(vn,vc,vl)
df1

df2<-as.data.frame(cbind(vn,vc,vl))
df2

#LIST
o1<-c(1,2,3)
o2<-c('a','b','c','d')
o3<-c(T,F,T,T,F)
list1<-list(o1,o2,o3) #lists within lists!
list1

list2<-list(o1,o2,o3,list1) #lists within lists!
list2



