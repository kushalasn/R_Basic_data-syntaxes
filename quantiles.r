dists=msleep$sleep_total-mean(msleep$sleep_total)
print(dists)
variance<-(dists)^2
#standard deviation
standard deviation=sqrt(var(mssleep$sleep_total))
sd(mssleep$sleep_total)
quantile(mssleep$sleep_total)
iqr=quantile(mssleep$sleep_total,0.75)-quantile(mssleep$sleep_total,0.25)
lower_threshold<-quantile(mssleep$bodywt,0.25)-1.5*iqr
upper_threshold<-quantile(mssleep$bodywt,0.75)+1.5*iqr
mssleep %>% filter(bodywt<lower_threshold | bodywt>upper_threshold) %>%
select(name,vore,sleep_total,bodywt)
