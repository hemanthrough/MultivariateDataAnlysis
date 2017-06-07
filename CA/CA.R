library(ggplot2)
library(cluster.datasets)
library(cluster) 
data(all.us.city.crime.1970)
crimes <- all.us.city.crime.1970
#scaling only 3 and 4 as they once which are related 
#all numerice fields are scaled 
crimes[,-c(1)]<- scale(crimes[,-c(1)])

crimes.kmeans<- kmeans(crimes[,-c(1)],3,nstart = 20)
crimes.kmeans$centers
clusplot(crimes[,-c(1)], crimes.kmeans$cluster, color=TRUE, shade=TRUE, 
         labels=3, lines=0)
#crimes.kmeans$totss
#the group assigned 
data.frame(crimes$city,crimes.kmeans$cluster)
#hierachical clustering
crimes <- all.us.city.crime.1970
crimes[,-c(1)]<- scale(crimes[,-c(1)])
crimes.dists <- dist(crimes)
crimes.hclust <- hclust(crimes.dists)

#plots a denogram
plot(crimes.hclust,labels=crimes$city,main='Default from hclust')
#represents line when they were joined 
table(cutree(crimes.hclust,3),crimes$city)
newcut<-cutree(crimes.hclust,3)
newcut
clusplot(crimes[,-c(1)], cutree(crimes.hclust,3), color=TRUE, shade=TRUE, 
         labels=3, lines=0)
