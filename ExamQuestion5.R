##Subsetting ToothGrowth
ToothGrowth
subset(ToothGrowth,supp=="VC")
#this only returns rows 1-30. 

ToothGrowth
subset(ToothGrowth,supp=="VC" & dose=="0.5")
#this returns only rows 1-10.

ToothGrowth
ToothGrowth$len[1:10]
#returns only values of len that comply with the above restriction
#which means only values 1-10. 