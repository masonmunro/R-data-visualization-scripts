library(colorspace)
library(dbplyr)
library(ggplot2)
library(RColorBrewer)
library(tidyverse)
library (ape)
#load necessary packages
dataframe1 <- as.data.frame(CN_total [,2:16384])
#Creates dataframe from copy number variation of top 1% of genes by VST
rownames(dataframe1) <- c("Sb1", "Sb10", "Sb11", "Sb12", "Sb13", "Sb14", "Sb15", "Sb16", "Sb18", "Sb2" ,"Sb20", "Sb21", "Sb22", "Sb23", "Sb24", "Sb25", "Sb26", "Sb27", "Sb28", "Sb29", "Sb3", "Sb34", "Sb4", "Sb5", "Sb6", "Sb8", "Sb9")
#Labels rows by sample
distance1 <- dist(dataframe1)
#Creates distance matrix from dataset (uses euclidean distance)
pcoanew <- pcoa(distance1)
#performs PCoA on distance matrix
axis1and2<- as.matrix(pcoanew[["vectors"]])
axis1and2 <- as.matrix(axis1and2[,1:2])
#extracts PCA axis 1 and 2 into a data set
mountainplot1 <- as.matrix(axis1and2[1:10,])
mountainplot2 <- as.matrix(axis1and2[23:27,])
mountainplot3 <- as.matrix(axis1and2[21,])
mountainplot3 <- t(mountainplot3)
#splits data set into mountains and beaches (extracts mountains)
beachplot1 <- as.matrix(axis1and2[11:20,])
beachplot2 <- as.matrix(axis1and2[22,])
beachplot2 <- t(beachplot2)
#extracts beaches
mountainplot <- rbind(mountainplot1, mountainplot2, mountainplot3)
beachplot <- rbind(beachplot1, beachplot2)
#binds datasets into 1 mountain dataset and 1 beach dataset
plot(beachplot, pch=0, xlab = "Variance explained = 14.8%", ylab = "Variance explained = 11.0%")
#creates a plot using coast points
points(mountainplot, pch = 16)
#adds mountain points to plot

#to make pcoa w/ sample names:
biplot.pcoa(pcoanew)
