library (gplots)
library (RColorBrewer)
#loads modules
setwd (genedatafortesting)
data <- as.matrix(genedatafortesting)
# loads data and creates matrix
palette1 <- hcl.colors(n = 13, palette = "Spectral", alpha = NULL, rev = FALSE,)
#creates heatmap color palette
rnames <- as.matrix(data[,1])
mat_data <- data.matrix(data[,2:ncol(data)])
rownames(mat_data) <- rnames
#creates a database with column headings
heatmap.2(mat_data, cellnote = ( mat_data ), trace = "none" , notecol = "black", Rowv = FALSE, Colv = FALSE, col = palette1, key = TRUE , keysize = 1.5 , key.title = Legend , density.info=c("density"), key.par = palette1, key.xlab = color, key.ylab = test, densadj = 0.25, notecex = 0.25 , cexRow = 0.5 , ylab = "ProteinID")
#defines heatmap



