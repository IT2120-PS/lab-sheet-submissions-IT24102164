#Excersice 01
#1
setwd("C:\\Users\\it24102164\\Desktop\\Lab04")

#import data
branch_data <- read.table("Exercise.txt", header = TRUE, sep = ",", stringsAsFactors = FALSE)

fix(data)

head(branch_data)

# Create a boxplot for the Sales_X1 variable
boxplot(branch_data$Sales_X1, 
        main = "Boxplot of Sales", 
        ylab = "Sales_X1", 
        col = "lightblue", 
        border = "red")


# Calculate the five-number summary for Advertising_X2
five_number_summary <- summary(branch_data$Advertising_X2)
print(five_number_summary)

# Calculate the IQR for Advertising_X2
IQR_value <- IQR(branch_data$Advertising_X2)
print(paste("IQR for Advertising_X2:", IQR_value))


#5
# find outliers in a numeric vector
find_outliers <- function(x) {
  #  (Q1, Q3)
  q1 <- quantile(x, 0.25)
  q3 <- quantile(x, 0.75)
  
  # Interquartile Range
  IQR_value <- IQR(x)
  
  # lower and upper bounds 
  lower_bound <- q1 - 1.5 * IQR_value
  upper_bound <- q3 + 1.5 * IQR_value
  
  # outliers
  outliers <- x[x < lower_bound | x > upper_bound]
  
  
  return(outliers)
}

# Check for outliers in the 'Years_X3' variable
outliers_years <- find_outliers(branch_data$Years_X3)

print(outliers_years)

