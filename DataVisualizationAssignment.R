#installing ggplot2
download.packages("ggplot2")
library(ggplot2)

#loading file
read.csv("MycotoxinData.csv",na.strings=".")
MycotoxinData

##QUESTION 2: making box plot with y axis label
ggplot(MycotoxinData,aes(x=Treatment,y=DON,color=Cultivar))+
  geom_boxplot()+
  geom_point(position=position_jitterdodge(dodge.width=0.9))+
  xlab("") + ylab("DON (ppm)")+
  theme_classic()
#it isnt clear where my boxes for the box plot are...

##QUESTION 3: make this data a bar chart
ggplot(MycotoxinData,aes(x=Treatment,y=DON,fill=Cultivar))+
  stat_summary(fun=mean,geom="bar",position="dodge",color="black")+
  stat_summary(fun.data=mean_se,geom="errorbar",position="dodge")+
  scale_color_manual(values=c("pink","purple"))+
  scale_fill_manual(values=c("pink","purple"))+
  xlab("") + ylab("DON (ppm)")+
  theme_classic()
#the error bars are coded but I cant see them in my plot. maybe they are too small?

##QUESTION 4:add data points to foreground
ggplot(MycotoxinData,aes(x=Treatment,y=DON,fill=Cultivar))+
  stat_summary(fun=mean,geom="bar",position="dodge",color="black")+
  stat_summary(fun.data=mean_se,geom="errorbar",position="dodge")+
  geom_point(position=position_jitterdodge(dodge.width=1),shape=21,color="Black")+
  scale_color_manual(values=c("pink","purple"))+
  scale_fill_manual(values=c("pink","purple"))+
  xlab("") + ylab("DON (ppm)")+
  theme_classic()

##QUESTION 5: match the color blind pallet
ggplot(MycotoxinData,aes(x=Treatment,y=DON,fill=Cultivar))+
  stat_summary(fun=mean,geom="bar",position="dodge",color="black")+
  stat_summary(fun.data=mean_se,geom="errorbar",position="dodge")+
  geom_point(position=position_jitterdodge(dodge.width=1),shape=21,color="Black")+
  scale_color_manual(values=c("#CC79A7","#009E73"))+
  scale_fill_manual(values=c("#CC79A7","#009E73"))+
  xlab("") + ylab("DON (ppm)")+
  theme_classic()

##QUESTION 6: facet based on cultivar
ggplot(MycotoxinData,aes(x=Treatment,y=DON,fill=Cultivar))+
  stat_summary(fun=mean,geom="bar",position="dodge",color="black")+
  stat_summary(fun.data=mean_se,geom="errorbar",position="dodge")+
  geom_point(position=position_jitterdodge(dodge.width=1),shape=21,color="Black")+
  scale_color_manual(values=c("#CC79A7","#009E73"))+
  scale_fill_manual(values=c("#CC79A7","#009E73"))+
  xlab("") + ylab("DON (ppm)")+
  facet_wrap(~Treatment*Cultivar,scales="free")+
  theme_classic()

##QUESTION 7: choose a theme
ggplot(MycotoxinData,aes(x=Treatment,y=DON,fill=Cultivar))+
  stat_summary(fun=mean,geom="bar",position="dodge",color="black")+
  stat_summary(fun.data=mean_se,geom="errorbar",position="dodge")+
  geom_point(position=position_jitterdodge(dodge.width=1),shape=21,color="Black")+
  scale_color_manual(values=c("#CC79A7","#009E73"))+
  scale_fill_manual(values=c("#CC79A7","#009E73"))+
  xlab("") + ylab("DON (ppm)")+
  facet_wrap(~Treatment*Cultivar,scales="free")+
  theme_dark(base_size = 11, base_family = "")
#changed to dark theme

##QUESTION 8: add transparency to data points
ggplot(MycotoxinData,aes(x=Treatment,y=DON,fill=Cultivar))+
  stat_summary(fun=mean,geom="bar",position="dodge",color="black")+
  stat_summary(fun.data=mean_se,geom="errorbar",position="dodge")+
  geom_point(position=position_jitterdodge(dodge.width=1),shape=21,color="Black",
             alpha=.5)+
  scale_color_manual(values=c("#CC79A7","#009E73"))+
  scale_fill_manual(values=c("#CC79A7","#009E73"))+
  xlab("") + ylab("DON (ppm)")+
  facet_wrap(~Treatment*Cultivar,scales="free")+
  theme_dark(base_size = 11, base_family = "")
#i used the alpha function to reduce the point opacity

##QUESTION 10: explore plotting options
ggplot(MycotoxinData,aes(x=Treatment,y=DON,color=Cultivar))+
  geom_count()+
  scale_size_area()+
  scale_color_manual(values=c("#CC79A7","#009E73"))+
  scale_fill_manual(values=c("#CC79A7","#009E73"))+
  xlab("") + ylab("DON (ppm)")+
  theme_classic()
# this plot shows how many values in each treatment overlap.
# I would use this for my data, since I have species counts


ggplot(MycotoxinData,aes(x=Treatment,y=DON,color=Cultivar))+
  geom_point()+
  geom_rug()+
  scale_color_manual(values=c("#CC79A7","#009E73"))+
  scale_fill_manual(values=c("#CC79A7","#009E73"))+
  xlab("") + ylab("DON (ppm)")+
  theme_classic()
#this plot adds tick marks? 


