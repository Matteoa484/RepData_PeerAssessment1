fill_data <- raw_data

fill_data[is.na(fill_data$steps), 1] <- 
    int_avg_steps[int_avg_steps$interval %in% fill_data$interval, 2]

fill_daily_steps <- 
    fill_data %>%
    group_by(date) %>%
    summarise(tot_steps = sum(steps, na.rm = TRUE))