library(readr)
library(dplyr)

# Read the CSV file
library(readr)
s_of_t_subset_CLEAN <- read_csv("s_of_t_subset_CLEAN.csv", 
                                col_types = cols(GT = col_factor(levels = c("Normal", 
                                                                            "Seizure"))))
View(s_of_t_subset_CLEAN)

## Create a box plot of the signal for eachh cclass of the GT column using base R
boxplot(s_of_t_subset_CLEAN$normalizedValue ~ s_of_t_subset_CLEAN$GT, 
        xlab = "Class", ylab = "Signal", 
        main = "Boxplot of Signal by Class")


# Lets compare the means of the two classes using t-test
t.test(s_of_t_subset_CLEAN$normalizedValue ~ s_of_t_subset_CLEAN$GT)

# lets try a non-parametric test like Wilcoxon rank sum test
wilcox.test(s_of_t_subset_CLEAN$normalizedValue ~ s_of_t_subset_CLEAN$GT)
plot(density(s_of_t_subset$normalizedValue[s_of_t_subset$GT == "Normal"]), col = "blue", main = "EEG Signal Depicting Seizure", xlab = "Normalized Signal", ylab = "Density")
lines(density(s_of_t_subset$normalizedValue[s_of_t_subset$GT == "Seizure"]), col = "red", main = "EEG Signal Depicting Seizure", xlab = "Normalized Signal", ylab = "Density")

