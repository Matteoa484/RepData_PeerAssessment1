# libraries
library(dplyr)
library(ggplot2)

# load data
source("./scripts/01_load_data.R")

# calculate daily total steps
source("./scripts/02_daily_steps.R")

# plot daily steps histogram
ggplot(daily_tot_steps) + 
geom_histogram(mapping = aes(x = tot_steps), binwidth = 750, fill = "gray66", color = "white") +
theme_bw() +
labs(x = "", y = "Count", title = "Histogram of the total number of steps taken each day")

# calculate mean
daily_steps_mean <- with(daily_tot_steps, round(mean(tot_steps), digits = 2))

# calculate median
daily_steps_med  <- median(daily_tot_steps$tot_steps, na.rm = TRUE)

# calculate interval average steps
source("./scripts/03_interval_avg_steps.R")

# plot time-series of 5-min interval
ggplot(int_avg_steps) +
geom_line(mapping = aes(x = interval, y = avg_steps))

# 5-min interval with max nr of steps
max_int <- as.numeric(int_avg_steps[which.max(int_avg_steps$avg_steps), 1])

# nr of missing values in database
miss_data <- sum(is.na(raw_data$steps))

# fill missing values and calculate daily steps
source("./scripts/04_fill_data.R")

# plot daily steps histogram (filled data)
ggplot(fill_daily_steps) + 
    geom_histogram(mapping = aes(x = tot_steps), binwidth = 750, fill = "gray66", color = "white") +
    theme_bw() +
    labs(x = "", y = "Count", title = "Histogram of the total number of steps taken each day (filled)")

# calculate mean
fill_steps_mean <- with(fill_daily_steps, round(mean(tot_steps), digits = 2))

# calculate median
fill_steps_med  <- median(fill_daily_steps$tot_steps)

#boxplot(daily_tot_steps$tot_steps, fill_daily_steps$tot_steps)

