##example for layering
install.packages("ggplot2")
library(ggplot2)

read.csv("TrapData.csv",na.strings = "na")
TrapData$Collected=as.numeric(TrapData$Collected)

ggplot(TrapData, aes(x=Species,y=Collected,color=Location,fill=Location))+
  stat_summary(fun=mean,geom="bar",position="dodge")+
  ylab("Number Collected")+
  xlab("Chrysobothris Species") 

# the three layers are the Stat_summary line, ylab, and xlab. 


##example for scales

ggplot(TrapData, aes(x=Species,y=Collected,color=Location,fill=Location))+
  stat_summary(fun=mean,geom="bar",position="dodge",color="black")+
  ylab("Number Collected")+
  xlab("Chrysobothris Species")+
  scale_fill_manual(values=c("pink","blue","purple"))
#the scale_fill_manual() allowed me to manually change colors.

##example of theme

ggplot(TrapData, aes(x=Species,y=Collected,color=Location,fill=Location))+
  stat_summary(fun=mean,geom="bar",position="dodge",color="black")+
  ylab("Number Collected")+
  xlab("Chrysobothris Species")+
  scale_fill_manual(values=c("pink","blue","purple"))+
  theme_classic()
#theme_classic() is an example of a theme

##example of facets

ggplot(TrapData, aes(x=Species,y=Collected,color=Location,fill=Location))+
  stat_summary(fun=mean,geom="bar",position="dodge",color="black")+
  ylab("Number Collected")+
  xlab("Chrysobothris Species")+
  scale_fill_manual(values=c("pink","blue","purple"))+
  theme_classic()+
  facet_wrap(~Species*Location,scales="free")
#facet_wrap is how to split data into subsets.  

