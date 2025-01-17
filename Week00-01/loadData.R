library(readr)
library(dplyr)
library(ggplot2)

# Read the CSV file
s_of_t_subset <- read_csv("s_of_t_subset.csv", col_names = FALSE, col_types = cols(X1 = col_double()))

# Rename the default column to 's'
s_of_t_subset <- s_of_t_subset %>% rename(s = X1)

# Sampling frequency
fs <- 500

# Create a time column
s_of_t_subset <- s_of_t_subset %>% mutate(time = (row_number() - 1) / fs)

# # Plot the data
# ggplot(s_of_t_subset, aes(x = time, y = s)) +
#   geom_line() +
#   labs(title = "EEG Signal Depicting Seizure", x = "Time (seconds)", y = "Signal (s)") +
#   theme_minimal()

# Plot the data
plot(s_of_t_subset$time,s_of_t_subset$s, main = "EEG Signal Depicting Seizure", 
xlab = "Time (seconds)", ylab = "Signal (s)", type='l')

# View the updated dataframe
View(s_of_t_subset)

# write the data to a csv file
write.csv(s_of_t_subset, "s_of_t_subset.csv", row.names = FALSE)


# Rename s to value 
s_of_t_subset <- s_of_t_subset %>% rename(value = s)

# Create a more detailed dataset
## Lets add a column with Normalized values of the signal, for each time-point
s_of_t_subset$normalizedValue <- (s_of_t_subset$value - mean(s_of_t_subset$value)) / sd(s_of_t_subset$value)
plot(density(s_of_t_subset$normalizedValue))

s_of_t_subset$GT <- ifelse(s_of_t_subset$time>12, "Seizure", "Normal" )  #NOTE: 12s and above was seizure.

# Superimpose the probability density function of the Normalized values of the signal for each class
# ggplot(s_of_t_subset, aes(x = normalizedValue, fill = GT)) +
#   geom_density(alpha = 0.5) +
#   labs(title = "EEG Signal Depicting Seizure", x = "Normalized Signal", y = "Density") +
#   theme_minimal()
# repeat using base R
plot(density(s_of_t_subset$normalizedValue[s_of_t_subset$GT == "Seizure"]), col = "red", main = "EEG Signal Depicting Seizure", xlab = "Normalized Signal", ylab = "Density")