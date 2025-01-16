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

# Plot the data
ggplot(s_of_t_subset, aes(x = time, y = s)) +
  geom_line() +
  labs(title = "EEG Signal Depicting Seizure", x = "Time (seconds)", y = "Signal (s)") +
  theme_minimal()

# View the updated dataframe
View(s_of_t_subset)