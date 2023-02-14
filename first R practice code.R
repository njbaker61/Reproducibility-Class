#this is a comment-annotate code
2+2
2/2
2*2

x = 3
y<- 2 ##this is equivalent to the equal sign

x+y

name<-"nicole"
seven<-"7"

class(seven)  #these are basic functions
class(x)


vec<-c(1,2,3,4,5,6,7) #numeric vector: adding c with parenthesis
vec

vec2<-c(1:1000)
vec2

##vectors can have character names in them, as well as true, false

vec2[2] #output a specific value in a vector- in this case, the 2nd

vec2+x  #adds value of x (3) to each number in our vector

mean(vec2) #average
sd(vec2)  #standard deviation
sd(vec)/sqrt(1000) #how to get standard error
sum(vec2)
median(vec2)
min(vec2)
max(vec2)
summary(vec2)
exp(vec2)
#>< # greater and less than
# | #or
# & #and
# != #not equal to
  
t<-1:10
t[(t>8)|(t<5)] ##getting specific values
t[t !=2]

1 %in% t #%in% determines if value is in a vector

#Matrices: must contain same data type

mat1<-matrix(data=c(1,2,3),nrow=3,ncol=3)
mat1 

mat2<-matrix(data=c("Nicole","Jordan","Kayla"),nrow=3,ncol=3)
mat2

mat1[2,2] #can get specific value in matrix
mat1[,2] #leave first spot blank to get the second column


#dataframes: can contain all kinds of data - can import

df<-data.frame(mat1[,1],mat2[,1]) 
df
colnames(df)<-c("value","name") ##heres how to rename columns
df

df$value #dollar sign gives output as well


#Subsetting data frames

df[df$name=="Jordan",] #gets all values associated with jordan
df$value[df$name=="Jordan"]

subset(df,name=="Jordan") #easier way to subset

#installing packages

install.packages("ggplot2")

