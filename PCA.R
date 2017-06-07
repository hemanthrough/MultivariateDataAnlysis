Price <- c(6,7,6,5,7,6,5,6,3,1,2,5,2,3,1,2)
Software <- c(5,3,4,7,7,4,7,5,5,3,6,7,4,5,6,3)
Aesthetics <- c(3,2,4,1,5,2,2,4,6,7,6,7,5,6,5,7)
Brand <- c(4,2,5,3,5,3,1,4,7,5,7,6,6,5,5,7)
data <- data.frame(Price, Software, Aesthetics, Brand)

pca <- princomp(data,cor = T)

library(readxl)
##real example
#imorting the data set
data_cars <- read_excel("E:/Hemanth/fra_uas/Sem_2/MDA/Workspace/MultivariateDataAnlysis/DataCars.xlsx")
#view the data
View(data_cars)
#adding only numerical columns
data_cars_num <- data_cars[8:19]
#converting na to 0
data_cars_num[is.na(data_cars_num)] <-0
#charactor to 0
cols <- sapply(data_cars_num, is.character)

data_cars_num[,cols] <- lapply(data_cars_num[,cols],as.numeric)


#removing all the na after convertion
data_cars_num[is.na(data_cars_num)] <-0

#data_cars_num[!is.numeric(data_cars_num)] <- 0
plot(data_cars_num)
boxplot(data_cars_num)


plot(scale(data_cars_num))
boxplot(scale(data_cars_num))

#variance will be very high
data_cars_num.pca = prcomp(data_cars_num)
data_cars_num.pca
plot(data_cars_num.pca)
data_cars_num.pca = prcomp(data_cars_num, scale.=TRUE)
data_cars_num.pca
plot(data_cars_num.pca)




#http://www.stat.cmu.edu/~cshalizi/uADA/12/lectures/ch18.pdf
#http://ww2.amstat.org/publications/jse/jse_data_archive.htm