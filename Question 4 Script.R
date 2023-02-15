##making a vector
z<-c(1:200)
z
mean(z) #100.5
sd(z) #57.88
z>1

##Making datadrame
df<-data.frame(z,z>1)
df

colnames(df)<-c("z","zlog")
df

##adding column
z^2
df2<-data.frame(z,z>1,z^2)
df2
colnames(df2)<-c("z","zlog","zsquared")
df2

##subsetting the dataframe
subset(df2,zsquared>10 & zsquared<100) #restricted to 9 rows
