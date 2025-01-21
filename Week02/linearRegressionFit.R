# Make a model that predicts the normalized value of a signal using the un-normalized value of the signal

# normalized signal = signal - mean(signal) / sd(signal)

# normalized signal = f(signal) ... this is the regression model

# Lets assume the regrsesion model f(signal) = beta_1*signal + beta_0

# beta_1 and beta_0 are the parameters of the model that we need to estimate

# We can estimate these parameters using the least squares method

# write the regression fit in R

library(readr)
s_of_t_subset_CLEAN_with2SDrule <- read_csv("s_of_t_subset_CLEAN_with2SDrule.csv", 
                                            col_types = cols(GT = col_factor(levels = c("Normal", 
                                                                                        "Seizure")), TwoSDRule = col_factor(levels = c("InControl", 
                                                                                                                                       "OutOfControl"))))
View(s_of_t_subset_CLEAN_with2SDrule)

fit <- lm(normalizedValue ~ value, data = s_of_t_subset_CLEAN)

# Coefficients:
#               Estimate Std. Error    t value Pr(>|t|)    
# (Intercept) -6.386e-02  1.313e-17 -4.863e+15   <2e-16 ***
# value        1.440e-02  1.887e-19  7.631e+16   <2e-16 ***

