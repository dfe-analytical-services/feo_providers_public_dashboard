## The intention of this is to re-arrange the data tables to be ready for viewing in the dashboard

## PRV01 data
PRV01_data <- PRV01_data %>%
  filter(
    country_name == "England",
    provider_type == "Total",
    cohort_selection == "Total"
  ) %>%
  select(-time_identifier, -geographic_level, -country_code, -country_name) %>%
  mutate(time_period = paste0(substring(time_period, 1, 4), "/", substring(time_period, 5, 6))) %>%
  mutate(
    spd_percent = ifelse(spd_percent == "c", "c", as.character(as.numeric(spd_percent) / 100)),
    emp_percent = ifelse(emp_percent == "c", "c", as.character(as.numeric(emp_percent) / 100)),
    learn_percent = ifelse(learn_percent == "c", "c", as.character(as.numeric(learn_percent) / 100)),
    no_dest_percent = ifelse(no_dest_percent == "c", "c", as.character(as.numeric(no_dest_percent) / 100))
  ) %>%
  # suppressProvProgression() %>%
  mutate(
    spd_percent = ifelse(suppressWarnings(!is.na(as.numeric(spd_percent))),
      as.numeric(spd_percent), spd_percent
    ),
    emp_percent = ifelse(suppressWarnings(!is.na(as.numeric(emp_percent))),
      as.numeric(emp_percent), emp_percent
    ),
    learn_percent = ifelse(suppressWarnings(!is.na(as.numeric(learn_percent))),
      as.numeric(learn_percent), learn_percent
    ),
    no_dest_percent = ifelse(suppressWarnings(!is.na(as.numeric(no_dest_percent))),
      as.numeric(no_dest_percent), no_dest_percent
    )
  )


## PRV02 data
PRV02_data <- PRV02_data %>%
  filter(
    country_name == "England",
    provider_type == "Total"
  ) %>%
  select(-time_identifier, -geographic_level, -country_code, -country_name) %>%
  mutate(time_period = paste0(substring(time_period, 1, 4), "/", substring(time_period, 5, 6))) %>%
  mutate(
    spd_percent = ifelse(spd_percent == "c", "c", as.character(as.numeric(spd_percent) / 100)),
    emp_percent = ifelse(emp_percent == "c", "c", as.character(as.numeric(emp_percent) / 100)),
    learn_percent = ifelse(learn_percent == "c", "c", as.character(as.numeric(learn_percent) / 100)),
    no_dest_percent = ifelse(no_dest_percent == "c", "c", as.character(as.numeric(no_dest_percent) / 100))
  ) %>%
  filter(!(age_group == "Total" & age_youth_adult != "Total")) %>% ## Remove these rows to avoid duplicate rows appearing in output tables when user select age_group = Total
  # suppressProvProgression() %>%
  mutate(
    spd_percent = ifelse(suppressWarnings(!is.na(as.numeric(spd_percent))),
      as.numeric(spd_percent), spd_percent
    ),
    emp_percent = ifelse(suppressWarnings(!is.na(as.numeric(emp_percent))),
      as.numeric(emp_percent), emp_percent
    ),
    learn_percent = ifelse(suppressWarnings(!is.na(as.numeric(learn_percent))),
      as.numeric(learn_percent), learn_percent
    ),
    no_dest_percent = ifelse(suppressWarnings(!is.na(as.numeric(no_dest_percent))),
      as.numeric(no_dest_percent), no_dest_percent
    )
  )



## PRV03 data
PRV03_data <- PRV03_data %>%
  filter(country_name == "England") %>%
  select(-time_identifier, -geographic_level, -country_code, -country_name) %>%
  mutate(time_period = paste0(substring(time_period, 1, 4), "/", substring(time_period, 5, 6))) %>%
  mutate(
    spd_percent = ifelse(spd_percent == "c", "c", as.character(as.numeric(spd_percent) / 100)),
    emp_percent = ifelse(emp_percent == "c", "c", as.character(as.numeric(emp_percent) / 100)),
    learn_percent = ifelse(learn_percent == "c", "c", as.character(as.numeric(learn_percent) / 100)),
    no_dest_percent = ifelse(no_dest_percent == "c", "c", as.character(as.numeric(no_dest_percent) / 100))
  ) %>%
  # suppressProvProgression() %>%
  mutate(
    spd_percent = ifelse(suppressWarnings(!is.na(as.numeric(spd_percent))),
      as.numeric(spd_percent), spd_percent
    ),
    emp_percent = ifelse(suppressWarnings(!is.na(as.numeric(emp_percent))),
      as.numeric(emp_percent), emp_percent
    ),
    learn_percent = ifelse(suppressWarnings(!is.na(as.numeric(learn_percent))),
      as.numeric(learn_percent), learn_percent
    ),
    no_dest_percent = ifelse(suppressWarnings(!is.na(as.numeric(no_dest_percent))),
      as.numeric(no_dest_percent), no_dest_percent
    )
  )

## PRV04 data
PRV04_data <- PRV04_data %>%
  filter(
    country_name == "England",
    provider_type == "Total",
    ssa_tier_2 == "Total"
  ) %>%
  select(-time_identifier, -geographic_level, -country_code, -country_name) %>%
  mutate(time_period = paste0(substring(time_period, 1, 4), "/", substring(time_period, 5, 6))) %>%
  mutate(
    spd_percent = ifelse(spd_percent == "c", "c", as.character(as.numeric(spd_percent) / 100)),
    emp_percent = ifelse(emp_percent == "c", "c", as.character(as.numeric(emp_percent) / 100)),
    learn_percent = ifelse(learn_percent == "c", "c", as.character(as.numeric(learn_percent) / 100)),
    no_dest_percent = ifelse(no_dest_percent == "c", "c", as.character(as.numeric(no_dest_percent) / 100))
  ) %>%
  # suppressProvProgression() %>%
  mutate(
    spd_percent = ifelse(suppressWarnings(!is.na(as.numeric(spd_percent))),
      as.numeric(spd_percent), spd_percent
    ),
    emp_percent = ifelse(suppressWarnings(!is.na(as.numeric(emp_percent))),
      as.numeric(emp_percent), emp_percent
    ),
    learn_percent = ifelse(suppressWarnings(!is.na(as.numeric(learn_percent))),
      as.numeric(learn_percent), learn_percent
    ),
    no_dest_percent = ifelse(suppressWarnings(!is.na(as.numeric(no_dest_percent))),
      as.numeric(no_dest_percent), no_dest_percent
    )
  )



## Leave for a future date to look at National tables

# # NAT01 data
# NAT01_data <- NAT01_data %>%
#   filter(
#     country_name == "England",
#     provision == "Total",
#     ethnicity_major == "Total",
#     ethnicity_minor == "Total"
#   ) %>%
#   select(-time_identifier, -geographic_level, -country_code, -country_name) %>%
#   mutate(time_period = paste0(substring(time_period, 1, 4), "/", substring(time_period, 5, 6))) %>%
#   mutate(
#     spd_percent = ifelse(spd_percent == "c", "c", as.character(as.numeric(spd_percent) / 100)),
#     emp_percent = ifelse(emp_percent == "c", "c", as.character(as.numeric(emp_percent) / 100)),
#     learn_percent = ifelse(learn_percent == "c", "c", as.character(as.numeric(learn_percent) / 100)),
#     no_dest_percent = ifelse(no_dest_percent == "c", "c", as.character(as.numeric(no_dest_percent) / 100))
#   ) %>%
#   # suppressProvProgression() %>%
#   mutate(
#     spd_percent = ifelse(suppressWarnings(!is.na(as.numeric(spd_percent))),
#       as.numeric(spd_percent), spd_percent
#     ),
#     emp_percent = ifelse(suppressWarnings(!is.na(as.numeric(emp_percent))),
#       as.numeric(emp_percent), emp_percent
#     ),
#     learn_percent = ifelse(suppressWarnings(!is.na(as.numeric(learn_percent))),
#       as.numeric(learn_percent), learn_percent
#     ),
#     no_dest_percent = ifelse(suppressWarnings(!is.na(as.numeric(no_dest_percent))),
#       as.numeric(no_dest_percent), no_dest_percent
#     )
#   )
