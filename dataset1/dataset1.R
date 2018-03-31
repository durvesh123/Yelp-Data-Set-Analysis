#read dataset1
data<-read.csv('/home/data/MT/dataset1/gdp-1950-1983.csv',header=TRUE,sep=',')


#remove last column which has NA's 
data<-data[, !(colnames(data) %in% c("X"))]
year<-as.data.frame(data[,1])

#normalizing function (scale function uses x-mean(x)/sd(x))
unnormalized_countries<-as.data.frame(data[,2:10])
countries<-as.data.frame(scale(data[,2:10])) 
normalized_data<-as.data.frame(cbind(year,countries))
colnames(normalized_data)[1]<-"YEAR"




library(plotly)


#Plot with unnormalized data

x<-c(year)
y1<-c(unnormalized_countries[[1]])
y2<-c(unnormalized_countries[[2]])
y3<-c(unnormalized_countries[[3]])
y4<-c(unnormalized_countries[[4]])
y5<-c(unnormalized_countries[[5]])
y6<-c(unnormalized_countries[[6]])
y7<-c(unnormalized_countries[[7]])
y8<-c(unnormalized_countries[[8]])
y9<-c(unnormalized_countries[[9]])


data<-data.frame(x,y1,y2,y3,y4,y5,y6,y7,y8,y9)
colnames(data)[colnames(data)=="data...1."] <- "x"
data$x <- factor(data$x, levels = data[["x"]])



p_plot1<-plot_ly(data, x = ~x, y = ~y1, type = 'bar', name = colnames(unnormalized_countries)[1], marker = list(color = 'rgb(49,130,189)')) %>%
  add_trace(y = ~y2, name = colnames(unnormalized_countries)[2], marker = list(color = 'rgb(201,46,46)')) %>%
  add_trace(y = ~y3, name = colnames(unnormalized_countries)[3], marker = list(color = 'rgb(224,224,224)')) %>%
  add_trace(y = ~y4, name = colnames(unnormalized_countries)[4], marker = list(color = 'rgb(255,255,102)')) %>%
  add_trace(y = ~y5, name = colnames(unnormalized_countries)[5], marker = list(color = 'rgb(0,0,102')) %>%
  add_trace(y = ~y6, name = colnames(unnormalized_countries)[6], marker = list(color = 'rgb(153,255,153)')) %>%
  add_trace(y = ~y7, name = colnames(unnormalized_countries)[7], marker = list(color = 'rgb(102,0,51)')) %>%
  add_trace(y = ~y8, name = colnames(unnormalized_countries)[8], marker = list(color = 'rgb(0,255,255)')) %>%
  add_trace(y = ~y9, name = colnames(unnormalized_countries)[9], marker = list(color = 'rgb(204,204,255)')) %>%
  layout(xaxis = list(title = "Year", tickangle = -45),
         yaxis = list(title = "Country"),margin = list(b = 100),
         barmode = 'group')

#Plot with normalized data

x<-c(year)
y1<-c(countries[[1]])
y2<-c(countries[[2]])
y3<-c(countries[[3]])
y4<-c(countries[[4]])
y5<-c(countries[[5]])
y6<-c(countries[[6]])
y7<-c(countries[[7]])
y8<-c(countries[[8]])
y9<-c(countries[[9]])


data<-data.frame(x,y1,y2,y3,y4,y5,y6,y7,y8,y9)
colnames(data)[colnames(data)=="data...1."] <- "x"
data$x <- factor(data$x, levels = data[["x"]])



p_plot<-plot_ly(data, x = ~x, y = ~y1, type = 'bar', name = colnames(countries)[1], marker = list(color = 'rgb(49,130,189)')) %>%
add_trace(y = ~y2, name = colnames(countries)[2], marker = list(color = 'rgb(201,46,46)')) %>%
add_trace(y = ~y3, name = colnames(countries)[3], marker = list(color = 'rgb(224,224,224)')) %>%
add_trace(y = ~y4, name = colnames(countries)[4], marker = list(color = 'rgb(255,255,102)')) %>%
add_trace(y = ~y5, name = colnames(countries)[5], marker = list(color = 'rgb(0,0,102')) %>%
add_trace(y = ~y6, name = colnames(countries)[6], marker = list(color = 'rgb(153,255,153)')) %>%
add_trace(y = ~y7, name = colnames(countries)[7], marker = list(color = 'rgb(102,0,51)')) %>%
add_trace(y = ~y8, name = colnames(countries)[8], marker = list(color = 'rgb(0,255,255)')) %>%
add_trace(y = ~y9, name = colnames(countries)[9], marker = list(color = 'rgb(204,204,255)')) %>%
layout(xaxis = list(title = "Year", tickangle = -45),
yaxis = list(title = "Country"),margin = list(b = 100),
barmode = 'group')