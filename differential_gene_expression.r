#Finds 10 genes taht are expressed specifically in each tissue by looking at differential expression

#Bring in tissue sample data
geneData <- read.table("/Users/ericvogel/Documents/Johns_Hopkins/Principles_of_Bioinformatics_EN.605.451.81.FA17/Assignments/Module 10/assignment_10_dataset.txt", sep="\t", row.names = 1, header=TRUE)

#Log transformation
tissueLogData = log2(tissueData)

#Create two datasets with the correct tissue log data in each
tissueA = tissueLogData[, c(1, 2, 6, 8)]
tissueB = tissueLogData[, c(3, 4, 5, 7)]

#Compute the mean of each expression level in each of the tissues
tissueA.mean = apply(tissueA, 1, mean)
tissueB.mean = apply(tissueB, 1, mean)

#Calculate the gold change value
foldChange = tissueA.mean = tissueB.mean

#Print out the 10 values at the top and bottom of the list with the sort function
head(sort(foldChange, decreasing = TRUE), 10)
head(sort(foldChange), 10)