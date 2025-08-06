library(gt)
library(dplyr)

# Sample data with mixed numeric and non-numeric values
df <- tibble(
  Category = c("A", "B", "Total"), # Non-numeric column
  Value1 = c(0.25, 0.30, "c"), # Mixed numeric & non-numeric
  Value2 = c(0.50, 0.60, 0.70) # Fully numeric
)

# Convert numeric values properly while keeping character values as is
df_clean <- df %>%
  mutate(Value1 = ifelse(suppressWarnings(!is.na(as.numeric(Value1))),
    as.numeric(Value1), Value1
  ))

# Create gt table with conditional formatting
gt_table <- df_clean %>%
  gt() %>%
  fmt(
    columns = c(Value1, Value2),
    fns = function(x) {
      ifelse(suppressWarnings(!is.na(as.numeric(x))),
        scales::percent(as.numeric(x), accuracy = 0.1), x
      )
    }
  )

gt_table




x <- PRV04_data %>%
  filter(
    provider_name == "AYLESBURY COLLEGE",
    ssa_tier_1 == "Total",
    level_of_learning == "Total"
  ) %>%
  select(time_period, provider_name, provision, number_of_matched_learners, spd_percent, emp_percent, learn_percent, no_dest_percent) %>%
  arrange(time_period, provision) %>%
  group_by(provider_name, time_period)


# Create gt table with conditional formatting
gt_table <- x %>%
  gt() %>%
  fmt(
    columns = c(spd_percent, no_dest_percent),
    fns = function(x) {
      ifelse(suppressWarnings(!is.na(as.numeric(x))),
        scales::percent(as.numeric(x), accuracy = 1), x
      )
    }
  )

gt_table
