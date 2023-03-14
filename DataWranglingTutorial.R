install.packages("tidyverse")
library(tidyverse)


microbiome.fungi<-read.csv("Microbiome.csv")

##select specific data

microbiome.fungi2<-select(microbiome.fungi,OTU,
                          SampleID,
                          Abundance,
                          Crop,
                          Compartment,
                          DateSampled,
                          GrowthStage,
                          Treatment,
                          Rep,
                          Fungicide,
                          Kingdom:Taxonomy)
##another way to subset

filter(microbiome.fungi2,Class=="Sordariomycetes")

##create data columns

mutate(microbiome.fungi2,Percent=Abundance*100)

##stitch the above functions together: the pipe (%>%) can string stuff together.
#with this, you dont need the data statement every time. 

microbiome.fungi %>% 
  select(OTU,
         SampleID,
         Abundance,
         Crop,
         Compartment,
         DateSampled,
         GrowthStage,
         Treatment,
         Rep,
         Fungicide,
         Kingdom:Taxonomy) %>%
  filter(Class=="Sordariomycetes") %>%
  mutate(Percent=Abundance*100)


##summarize function- can be added to pipe

microbiome.fungi %>% 
  select(OTU,
         SampleID,
         Abundance,
         Crop,
         Compartment,
         DateSampled,
         GrowthStage,
         Treatment,
         Rep,
         Fungicide,
         Kingdom:Taxonomy) %>%
  filter(Class=="Sordariomycetes") %>%
  mutate(Percent=Abundance*100) %>%
  summarise(Mean=mean(Percent)) ##produces one value

##can do multiple summaries in one:

microbiome.fungi %>% 
  select(OTU,
         SampleID,
         Abundance,
         Crop,
         Compartment,
         DateSampled,
         GrowthStage,
         Treatment,
         Rep,
         Fungicide,
         Kingdom:Taxonomy) %>%
  filter(Class=="Sordariomycetes") %>%
  mutate(Percent=Abundance*100) %>%
  summarise(Mean=mean(Percent),
            n=n(),
            st.dev=sd(Percent)) %>%
  mutate(std.err=st.dev/sqrt(n)) ##add standard error

##what if we wanted all orders within the class we used?. where you put it matters!

microbiome.fungi %>% 
  select(OTU,
         SampleID,
         Abundance,
         Crop,
         Compartment,
         DateSampled,
         GrowthStage,
         Treatment,
         Rep,
         Fungicide,
         Kingdom:Taxonomy) %>%
  filter(Class=="Sordariomycetes") %>%
  mutate(Percent=Abundance*100) %>%
  group_by(Order) %>% ##added here
  summarise(Mean=mean(Percent),
            n=n(),
            st.dev=sd(Percent)) %>%
  mutate(std.err=st.dev/sqrt(n))


## to rearrange by mean:

microbiome.fungi %>% 
  select(OTU,
         SampleID,
         Abundance,
         Crop,
         Compartment,
         DateSampled,
         GrowthStage,
         Treatment,
         Rep,
         Fungicide,
         Kingdom:Taxonomy) %>%
  filter(Class=="Sordariomycetes") %>%
  mutate(Percent=Abundance*100) %>%
  group_by(Order) %>% ##added here
  summarise(Mean=mean(Percent),
            n=n(),
            st.dev=sd(Percent)) %>%
  mutate(std.err=st.dev/sqrt(n)) %>%
  arrange(Mean) ##adding a - before mean makes the order flip, so itll go from high to low


##to make a plot: you can use ggplot function plus other layers.

microbiome.fungi %>% 
  select(OTU,
         SampleID,
         Abundance,
         Crop,
         Compartment,
         DateSampled,
         GrowthStage,
         Treatment,
         Rep,
         Fungicide,
         Kingdom:Taxonomy) %>%
  filter(Class=="Sordariomycetes") %>%
  mutate(Percent=Abundance*100) %>%
  group_by(Order) %>% ##added here
  summarise(Mean=mean(Percent),
            n=n(),
            st.dev=sd(Percent)) %>%
  mutate(std.err=st.dev/sqrt(n)) %>%
  arrange(Mean) %>%
  ggplot(aes(x=Mean,y=Order))+
  geom_bar(stat="identity")+ ##identity allows bars to be exact numbers in data
  theme_classic(base_size = 15)
  


