library(colorspace)
library(dbplyr)
library(ggplot2)
library(RColorBrewer)
library(tidyverse)
library (ape)
#load necessary packages
dataframe2 <- as.data.frame(genedatafortesting[,2:28])
#Creates dataframe from copy number variation of salt genes
dataframe2t <- t(dataframe2)
#transposes so samples are y axis
rownames(dataframe2t) <- c("Sb1", "Sb10", "Sb11", "Sb12", "Sb13", "Sb14", "Sb15", "Sb16", "Sb18", "Sb2" ,"Sb20", "Sb21", "Sb22", "Sb23", "Sb24", "Sb25", "Sb26", "Sb27", "Sb28", "Sb29", "Sb3", "Sb34", "Sb4", "Sb5", "Sb6", "Sb8", "Sb9")
#Labels rows by sample
distance2 <- dist(dataframe2t)
#Creates distance matrix from dataset (uses euclidean distance)
pcoa2 <- pcoa(distance2)
#performs PCoA on distance matrix
axes<- as.matrix(pcoa2[["vectors"]])
axes <- as.matrix(axes[,1:2])
#extracts PCA axis 1 and 2 into a data set
mountainplota <- as.matrix(axes[1:10,])
mountainplotb <- as.matrix(axes[23:27,])
mountainplotc <- as.matrix(axes[21,])
mountainplotc <- t(mountainplotc)
#splits data set into mountains and beaches (extracts mountains)
beachplota <- as.matrix(axes[11:20,])
beachplotb <- as.matrix(axes[22,])
beachplotb <- t(beachplotb)
#extracts beaches
mountainplotall <- rbind(mountainplota, mountainplotb, mountainplotc)
beachplotall <- rbind(beachplota, beachplotb)
#binds datasets into 1 mountain dataset and 1 beach dataset
plot(beachplotall, pch=0, xlab = "Variance explained = 14.8%", ylab = "Variance explained = 11.0%")
#creates a plot using coast points
points(mountainplotall, pch = 16)
#adds mountain points to plot

#to make pcoa w/ sample names:
biplot.pcoa(pcoa2)
