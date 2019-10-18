
    
lineloss1 <- as.matrix(fishertest[1,1:2])    
lineloss2 <- as.matrix(fishertest[1,4:5])  
squareloss1 <- rbind(lineloss1 , lineloss2)
loss1 <- fisher.test(squareloss1, or = 1, conf.int = TRUE , conf.level = .95  )
losspvalues <- as.matrix(loss1"[[p.value]]")
#this is the general shell that needs to be looped for losses (or =1 means odds ratio is 1, ie, you expect both conditions to have the same ratio of gains and losses)

linegain1 <- as.matrix(fishertest[1,2:3])    
linegain2 <- as.matrix(fishertest[1,5:6])  
squaregain1 <- rbind(linegain1 , linegain2)
gain1 <- fisher.test(squaregain1, or = 1, conf.int = TRUE , conf.level = .95  )
gainpvalues <- as.matrix(gain1"[[p.value]]")
#and this is gains

#this needs to be looped for each line and the p-value reported