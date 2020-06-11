raw_data <- 
    readr::read_delim(
        file = "activity.zip",
        delim = ",",
        na = "NA",
        col_names = TRUE,
        col_types    = readr::cols(
            steps    = readr::col_double(),
            date     = readr::col_date(format = ""),
            interval = readr::col_double()
        )
    )