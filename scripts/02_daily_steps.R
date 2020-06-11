daily_tot_steps <- 
    raw_data %>%
    filter(!is.na(steps)) %>%
    group_by(date) %>%
    summarise(tot_steps = sum(steps))
