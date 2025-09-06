setwd("C:/Users/IT24103660/Desktop/IT24102164")
Delivery_Times = read.table("Exercise - Lab 05.txt",header = TRUE)
fix(Delivery_Times)
attach(Delivery_Times)
names(Delivery_Times) <- c("X3")
fix(Delivery_Times)
attach(Delivery_Times)
histogram<-hist(X3,main = "Histogram for number of Delivary Times",breaks = seq(20,70,length = 9),right = FALSE)
breaks <- round(histogram$breaks)
breaks
freq <- histogram$counts
freq
mids <- histogram$mids
mids
classes <- c()
for(i in 1:length(breaks)-1){
  classes[i] <- paste0("[",breaks[i],",",breaks[i+1],")")
}
cbind(classes = classes, Frequency = freq)
lines(mids, freq)
plot(mids, freq, type = 'l', main = "Frequency Polygon for Delivary Times",xlab = "NO Of Delivary",ylab = "Time",ylim = c(0,max(freq)))
