library(gdata)  
library(RColorBrewer)
library(maps)
library(ggplot2)

#Reading in from the data I collected in Excel
CO <- read.xls("Tracking_Issues.xlsx", sheet = 1)

# Ordering
CO <- CO[order(CO$November, decreasing=TRUE),]
row.names(CO) <- CO$Terms
COMatrix <- data.matrix(CO) #create the data matrix
COMatrix <- COMatrix[,-1]  #took off the first default row (terms)

#generate the heatmap
CO_heatmap <- heatmap(COMatrix, Rowv=NA, Colv=NA, col = brewer.pal(9, "Blues"), scale="column", margins=c(7,10), main = "Colorado Senate Race Keywords Frequency")


VA <- read.xls("Tracking_Issues.xlsx", sheet = 2)
VA <- VA[order(VA$November, decreasing=TRUE),]
row.names(VA) <- VA$Terms
VAMatrix <- data.matrix(VA)
VAMatrix <- VAMatrix[,-1]
VA_heatmap <- heatmap(VAMatrix, Rowv=NA, Colv=NA, col = brewer.pal(9, "Blues"), scale="column", margins=c(7,10),main = "Virginia Senate Race Keywords Frequency")

FL <- read.xls("Tracking_Issues final.xlsx", sheet = 4)

# Ordering
FL <- FL[order(FL$January, decreasing=TRUE),]
row.names(FL) <- FL$Terms
FLMatrix <- data.matrix(FL) #create the data matrix
FLMatrix <- FLMatrix[,-1]  #took off the first default row (terms)

FL_heatmap <- heatmap(FLMatrix, Rowv=NA, Colv=NA, col = brewer.pal(9, "PuRd"), scale="column", margins=c(7,10), main = "Florida Keywords Frequency")
