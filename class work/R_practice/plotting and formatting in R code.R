##data formatting/plotting

data("mtcars") #this is from R
head(mtcars)
plot(x=mtcars$wt,y=mtcars$mpg) #produces basic plot

plot(x=mtcars$wt,y=mtcars$mpg,
     xlab="Car Weight",
     ylab="Miles per Gallon",    ###formatting for labels, font, and point type
     font.lab=6,
     pch=20) 
##we can explore options of what we need to do for our data
#ggplot cheat sheet is really useful


##using ggplot

ggplot(mtcars,aes(x=wt,y=mpg)) #provides axes
ggplot(mtcars,aes(x=wt,y=mpg))+
  geom_point() +    #adds data points
  geom_smooth(method=lm,se=FALSE) #linear trend line, can remove conf. int with se
  
#organization of how graph looks depending on order of the codes: ex. points ahead of or behind the trendline

ggplot(mtcars,aes(x=wt,y=mpg))
ggplot(mtcars,aes(x=wt,y=mpg))+
  geom_point() +  
  geom_smooth(method=lm,se=FALSE)+
  
  xlab("Weight") + ylab("Miles per Gallon") + #labels axes what you want
  theme_classic()  #can explore themes for graphs?


##scales-size

ggplot(mtcars,aes(x=wt,y=mpg))
ggplot(mtcars,aes(x=wt,y=mpg))+
  geom_point(aes(size=wt)) +  #here
  geom_smooth(method=lm,se=FALSE)+
  
  xlab("Weight") + ylab("Miles per Gallon") + 
  theme_classic() 

##scales-color

ggplot(mtcars,aes(x=wt,y=mpg))
ggplot(mtcars,aes(x=wt,y=mpg))+
  geom_point(aes(color=wt)) +  #here
  geom_smooth(method=lm,se=FALSE)+
  
  xlab("Weight") + ylab("Miles per Gallon") + 
  theme_classic() +
  scale_color_gradient(low="forestgreen",high="blue") #here
  
##log transforming 

ggplot(mtcars,aes(x=wt,y=mpg))
ggplot(mtcars,aes(x=wt,y=mpg))+
  geom_point(aes(color=wt)) +  
  geom_smooth(method=lm,se=FALSE)+
  
  xlab("Weight") + ylab("Miles per Gallon") + 
  theme_classic() +
  scale_color_gradient(low="forestgreen",high="blue") +
  scale_y_log10() #here



##

bull.richness<-read.csv("/Users/nicolescomputer/Documents/Reproducibility/research/Reproducibility/Repository/BullRichness.csv",na.strings=NA)
##ill figure this out....

bull.richness.soy.no.till<-BullRichness[BullRichness$Crop == "Soy" & 
                                          BullRichness$Treatment=="No-till",]


ggplot(bull.richness.soy.no.till, aes(x=GrowthStage,y=richness,color=Fungicide))+
  geom_boxplot() +
  geom_point(position = position_jitterdodge(dodge.width=0.9))




### Next lesson 2/21/23

##Bar charts

ggplot(bull.richness.soy.no.till, aes(x=GrowthStage,y=richness,color=Fungicide))+
  stat_summary(fun=mean,geom="bar")+
  stat_summary(fun.data=mean_se,geom="errorbar")

##adjust position, dodge bars

ggplot(bull.richness.soy.no.till, aes(x=GrowthStage,y=richness,color=Fungicide))+
  stat_summary(fun=mean,geom="bar",position="dodge")+
  stat_summary(fun.data=mean_se,geom="errorbar",position="dodge")

##change bar color, add points with outlines - need color and fill

ggplot(bull.richness.soy.no.till, aes(x=GrowthStage,y=richness,fill=Fungicide))+
  stat_summary(fun=mean,geom="bar",position="dodge")+
  stat_summary(fun.data=mean_se,geom="errorbar",position="dodge")+
  geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,color="Black")+
  scale_color_manual(values=c("blue","green"))+
  scale_fill_manual(values=c("blue","green"))


##represent data over time:

ggplot(bull.richness.soy.no.till, aes(x=GrowthStage,y=richness,group=Fungicide,color=Fungicide))+
  stat_summary(fun=mean,geom="line")+
  stat_summary(fun=mean,geom="point")+
  stat_summary(fun.data=mean_se,geom="errorbar")+
  ylab("richness \n of fungi")

### \n is like hitting the enter button, allows to deterimne where to split titles/labels



##Faceting- can apply code above used on subsetted data to whole data set 

ggplot(BullRichness, aes(x=GrowthStage,y=richness,group=Fungicide,color=Fungicide))+
  stat_summary(fun=mean,geom="line")+
  stat_summary(fun=mean,geom="point")+
  stat_summary(fun.data=mean_se,geom="errorbar")+
  ylab("richness \n of fungi")+
  facet_wrap(~Treatment*Crop,scales="free") 
## the * allows you to block by specific interactions. can be in any order.
# scales="free" allows each plot to be formatted and scaled properly


#theme

ggplot(BullRichness, aes(x=GrowthStage,y=richness,group=Fungicide,color=Fungicide))+
  stat_summary(fun=mean,geom="line")+
  stat_summary(fun=mean,geom="point")+
  stat_summary(fun.data=mean_se,geom="errorbar")+
  ylab("richness \n of fungi")+
  facet_wrap(~Treatment*Crop,scales="free")+
  theme_dark()+ ##can be anything, i just wanted to try dark
  scale_color_manual(values=c("pink","purple"))+ #can be any colors
  geom_jitter() #didnt see the rest of the code.




