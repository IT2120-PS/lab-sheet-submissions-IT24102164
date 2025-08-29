
setwd("C:/Users/user/OneDrive/Desktop/IT24102164_Lab_03")

student_data <- read.csv("Exercise.csv",header=TRUE)

summary(student_data$X1)
hist(student_data$X1,
     main = "Histogram of Age",
     xlab = "Age",
     col = "skyblue",
     border = "black")

table(student_data$X2)
barplot(table(student_data$X2),
        main = "Gender Distribution",
        xlab = "Gender (1=Male, 2=Female)",
        ylab = "Frequency",
        col = c("lightblue","pink"))

boxplot(X1 ~ X3, data = student_data,
        main = "Age vs Accommodation Type",
        xlab = "Accommodation (1=Home, 2=Boarded, 3=Lodging)",
        ylab = "Age",
        col = c("lightgreen", "lightblue", "lightpink"))