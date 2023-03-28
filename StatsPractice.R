##practice with statistics. load up these packages:
library(tidyverse)
library(lme4)
library(emmeans)
library(multcomp)
BullRichness

data("mtcars")

ggplot(mtcars,aes(x=wt,y=mpg))+
  geom_smooth(method=lm,se=FALSE) +
  geom_point()
#gave us a best fit line by adding method=lm. se=FALSE gets rid of grey area

##using lm function ## - y goes first, followed by x variable(s)

lm1<-lm(mpg~wt,data=mtcars)
#gives us intercept (beta0) and our slope (beta1)

summary(lm1)
#gives us the statistic output - intercept and beta1 intercept, along with significance
#you also get overall model p value at the bottom right, and adj. r squared

## correlation test ##

cor.test(mtcars$wt,mtcars$mpg)
#gives a correlation value or how correlated points are with best fit line. also p value, etc.

## to plot the residuals##

ggplot(lm1,aes(y=.resid,x=.fitted)) +
  geom_point()+
  geom_hline(yintercept=0)
#can help determine if relationship is truly linear between data.

plot(lm1)
#can also show linear relationship

###analyzing data


BullRichness %>%
  filter(GrowthStage=="V8" & Treatment=="Conv.") %>%
  ggplot(aes(x=Fungicide,y=richness)) +
  geom_boxplot()

BullRichSub<-BullRichness %>%
  filter(GrowthStage=="V8" & Treatment=="Conv.")

t.test(richness~Fungicide,data=BullRichSub,var.equal=TRUE)
#or
summary(lm(richness~Fungicide,data=BullRichSub))
#or
anova(lm(richness~Fungicide,data=BullRichSub))

##do some analysis...

BullRichSub2<-BullRichness %>%
  filter(Fungicide=="C" & Treatment=="Conv." & Crop=="Corn")

ggplot(BullRichSub2, aes(x=GrowthStage,y=richness)) +
  geom_boxplot()

lm.growth<-lm(richness~GrowthStage,data=BullRichSub2)
summary(lm.growth)

anova(lm.growth) #shows that one comparison is significant.

##Using emmeans, cld function

lsmeans<-emmeans(lm.growth,~GrowthStage)
summary(lsmeans)
##for cld, you need multcomp and multcompView installed and downloaded
results<-cld(lsmeans,alpha=0.05,reversed=TRUE,details=TRUE)
results

##interactions

BullRichSub3<-BullRichness %>%
  filter(Treatment=="Conv." & Crop=="Corn")

lm.inter<-lm(richness~GrowthStage+Fungicide+Growthstage:Fungicide,
             data=BullRichSub3)
#a shorter way is to use a *:
lm.inter<-lm(richness~GrowthStage*Fungicide,data=BullRichSub3)
summary(lm.inter)
anova(lm.inter)

ggplot(BullRichSub3,aes(x=GrowthStage,y=richness,fill=Fungicide))+
  geom_boxplot()

lsmeans<-emmeans(lm.inter,~Fungicide|GrowthStage)
lsmeans
#the | stands for within, so Fungicide within GrowthStage.
results<-cld(lsmeans,alpha=0.05,reversed=TRUE,details=TRUE)
results
###results output shows you where significant differences are.
##for this example, theres a significant difference within growthstage 8
#so, the fungicides are significantly different.

##random effects - use lmer

lm.inter<-lm(richness~GrowthStage+Fungicide+GrowthStage:Fungicide,
             data=BullRichSub3)
lme1<-lmer(richness~GrowthStage*Fungicide + (1|Rep),
           data=BullRichSub3)

#the (1|Rep) is what adds the random effect of replicate.

summary(lm.inter)

summary(lme1)


