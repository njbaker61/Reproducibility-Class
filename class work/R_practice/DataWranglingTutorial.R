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


## data replacement

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
  replace_na(list(Order="Unidentified")) %>% ### replace NA in order column
  arrange(Mean) %>%
  ggplot(aes(x=Mean,y=Order))+
  geom_bar(stat="identity")+ 
  theme_classic(base_size = 15)


##reordering categories of Y (order)

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
  replace_na(list(Order="Unidentified")) %>%
  mutate(Order2=fct_reorder(Order,desc(-Mean))) %>% ##here
  ggplot(aes(y=Order2,x=Mean))+
  geom_bar(stat="identity")+ 
  theme_classic(base_size = 15)

## Joining data sets
#using specific function from specific package: package::function

taxonomy<-microbiome.fungi2 %>%
  select(OTU,Kingdom:Taxonomy) %>%
  sample_n(size=100) 

metadata<-microbiome.fungi2 %>%
  select(OTU:Fungicide) %>%
  sample_n(size=100)

left_join(taxonomy,metadata,by="OTU") #by=column header common between both datasets
#right_join connects the other way.

inner_join(taxonomy,metadata,by="OTU")
#binds together data that matches between set

#full_join keeps everything from both datasets


## pivoting: wide and long data

#pivot_wider()
#pivot_longer() - prefer pivot longer.

microbiome.fungi3<-microbiome.fungi %>% 
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
  group_by(Order,Crop,Compartment,Fungicide) %>%
  summarise(Mean=mean(Percent)) %>%
  pivot_wider(names_from=Fungicide,values_from=Mean) %>%
  mutate(diff= C - F) %>%
  ggplot(aes(x=Order,y=diff))+
  geom_point()




