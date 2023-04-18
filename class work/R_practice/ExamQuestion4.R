##example for layering
install.packages("ggplot2")
library(ggplot2)

TrapData<-read.csv("TrapData.csv")

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
  theme_classic(base_size = 15)
#theme_classic() is an example of a theme. the base size is just to adjust the text so it is easier to read.

##example of facets

ggplot(TrapData, aes(x=Species,y=Collected,color=Location,fill=Location))+
  stat_summary(fun=mean,geom="bar",position="dodge",color="black")+
  ylab("Number Collected")+
  xlab("Chrysobothris Species")+
  scale_fill_manual(values=c("pink","blue","purple"))+
  theme_classic(base_size = 15)+
  facet_wrap(~Species*Location,scales="free")
#facet_wrap is how to split data into subsets. 

##Extra: italicizing x axis title

ggplot(TrapData, aes(x=Species,y=Collected,fill=Location))+
  stat_summary(fun=mean,geom="bar",position="dodge",color="black")+
  labs(y="Number Collected",
       x=expression(~italic(Chrysobothris)~ 'Species'))+
  scale_fill_manual(values=c("pink","blue","purple"))+
  theme_classic(base_size = 15)
#I just wanted to see if I could make the genus italic.
