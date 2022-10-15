
## !Didn't convert the class of Age, BloodPressure from double to integer

rm(list = ls()) # Erase all objects in memory

getwd() # Show working directory
library(readr)
patients <- read_csv("patients.csv", col_types = cols(Sex = col_factor(levels = c("M", "F")), 
                                                      HeartAttack = col_factor(levels = c("0", "1"))))
#View(patients)

# Convert the class of Sex and HeartAttack from character to factor 
# The class of Age, BloodPressure from double to integer won't change


str(patients) # Data structure of the data set patient

head(patients) # Use head(patients) to show the data
