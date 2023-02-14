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

