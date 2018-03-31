#The .csv file is missing headers. I am reading csv file in R, converting it to a data frame and then writing it to a csv. R 
automatically inserts headers into the csv file. I have then imported this csv into mongo db and run the below queries.

#R
data<-read.csv("/home/data/MT/dataset3/d24.csv",sep=",",header=F,stringsAsFactors=F)
write.csv(data,file='dvv223_d24.csv')