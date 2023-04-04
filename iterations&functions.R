##iterations and functions

#install tidyverse and drc packages

## How to make our own functions:
#example: farenheit to celsius

(5*(degree_F-32)/9) #any value can be degree_F

#in order to not have to copy it over and over:
#structure:
function.name<-function(x){
  #code goes here#
  return(#output goes here#)
}

celsius.calc<-function(x){
 C<-(5*(x-32)/9)
 return(C)
}

#to use:

celsius.calc(80)

##farenheit to celsius

fahrenheit.calc<-function(c){
  x<-((c*(9/5))+32)
  return(x)
}

fahrenheit.calc(0) #gives 32!

## you can make a function to code a plot

## For loop:
#start- code block- last iteration(y/n)
#if n, goes to start, if y, gives final output

for (i in 1:10){
  print(i*2)
}

#more complicated example, use a function!:

for (i in -100:100){
  result<-celsius.calc(i)
  print(result)
}


#example using real data:

EC50.data<-read.csv("EC50.all.csv")
EC50.data #to view

nm<-unique(EC50.data$is)

seq_along(nm)
nm[1] #specific name

for (i in seq_along(nm)){
  isolate1<-drm(100*EC50.data$relgrowth[EC50.data$is==nm[[1]]])~
  (EC50.data$conc[EC50.data$is==nm[[1]]]
  fct=LL.4(fixed=c(NA,NA,NA,NA)
  names=c("Slope","Lower","Upper","EC50"))
  na.action=na.omit)
  
summary.fit<-data.frame(summary(isolate1)[[1]])

}

## save output of a loop to a new dataframe that can be called





























