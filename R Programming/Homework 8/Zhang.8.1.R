
## !Converted the class of Age, BloodPressure from double to integer

rm(list = ls()) # Erase all objects in memory

getwd() # Show working directory


# The generated R code when importing the CSV file and the code that convert data types 
library(readr)
patients <- read_csv("patients.csv", col_types = cols(Age = col_integer(), 
                                                      Sex = col_factor(levels = c("F", "M")), 
                                                      BloodPressure = col_integer(), 
                                                      HeartAttack = col_factor(levels = c("1", "0"))))
#View(patients)

# Convert the class of Sex and HeartAttack from character to factor 
# I also converted the class of Age, BloodPressure from double to integer 


str(patients) # Data structure of the data set patient

head(patients) # Use head(patients) to show the data
