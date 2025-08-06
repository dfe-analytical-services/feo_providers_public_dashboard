## This formats the 01 table
Formatting_01_table <- function(table_input) {
  formatted_table <- table_input %>%
    gt() %>%
    fmt( ## This is a special function to only format the numbers as % and leave the 'c's as is
      columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent),
      fns = function(x) {
        case_when(
          grepl("^-?\\d+(\\.\\d+)?$", x) ~ scales::percent(as.numeric(x), accuracy = 1),
          TRUE ~ x # Keep non-numeric values unchanged
        )
      }
    ) %>%
    fmt(
      columns = c(number_of_matched_learners),
      fns = function(x) {
        case_when(
          grepl("^-?\\d+(\\.\\d+)?$", x) ~ scales::number(as.numeric(x), big.mark = ","),
          TRUE ~ x # Keep non-numeric values unchanged
        )
      }
    ) %>%
    cols_label(
      time_period = md("**Academic Year**"),
      provider_name = md("**Provider name**"),
      number_of_matched_learners = md("**Number of matched learners**"),
      benefit_learner = md("**Benefit status of learner**"),
      spd_percent = md("**Sustained positive destination rate**"),
      emp_percent = md("**Percent in employment**"),
      learn_percent = md("**Percent in learning**"),
      no_dest_percent = md("**Percent with no destination**")
    ) %>%
    cols_align(
      align = c("left"),
      columns = c(time_period, provider_name)
    ) %>%
    cols_align(
      align = c("right"),
      columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent)
    ) %>%
    tab_style(
      style = cell_text(
        weight = "bold"
      ),
      locations = cells_row_groups()
    ) %>%
    # Styling to match GOV.UK table look
    tab_options(
      table.font.names = "Arial",
      table.border.top.color = "black",
      table.border.bottom.color = "black",
      column_labels.border.top.color = "black",
      column_labels.border.bottom.color = "black",
      row.striping.include_table_body = TRUE,
      row.striping.background_color = "#f3f2f1" # GOV.UK light grey for striped rows
    )


  return(formatted_table)
}


## This formats the 02 table
Formatting_02_table <- function(table_input) {
  formatted_table <- table_input %>%
    gt() %>%
    fmt( ## This is a special function to only format the numbers as % and leave the 'c's as is
      columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent),
      fns = function(x) {
        case_when(
          grepl("^-?\\d+(\\.\\d+)?$", x) ~ scales::percent(as.numeric(x), accuracy = 1),
          TRUE ~ x # Keep non-numeric values unchanged
        )
      }
    ) %>%
    fmt(
      columns = c(number_of_matched_learners),
      fns = function(x) {
        case_when(
          grepl("^-?\\d+(\\.\\d+)?$", x) ~ scales::number(as.numeric(x), big.mark = ","),
          TRUE ~ x # Keep non-numeric values unchanged
        )
      }
    ) %>%
    cols_label(
      time_period = md("**Academic Year**"),
      provider_name = md("**Provider name**"),
      number_of_matched_learners = md("**Number of matched learners**"),
      sex = md("**Sex**"),
      spd_percent = md("**Sustained positive destination rate**"),
      emp_percent = md("**Percent in employment**"),
      learn_percent = md("**Percent in learning**"),
      no_dest_percent = md("**Percent with no destination**")
    ) %>%
    cols_align(
      align = c("left"),
      columns = c(time_period, provider_name)
    ) %>%
    cols_align(
      align = c("right"),
      columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent)
    ) %>%
    tab_style(
      style = cell_text(
        weight = "bold"
      ),
      locations = cells_row_groups()
    ) %>%
    # Styling to match GOV.UK table look
    tab_options(
      table.font.names = "Arial",
      table.border.top.color = "black",
      table.border.bottom.color = "black",
      column_labels.border.top.color = "black",
      column_labels.border.bottom.color = "black",
      row.striping.include_table_body = TRUE,
      row.striping.background_color = "#f3f2f1" # GOV.UK light grey for striped rows
    )


  return(formatted_table)
}


## This formats the 03 table
Formatting_03_table <- function(table_input) {
  formatted_table <- table_input %>%
    gt() %>%
    fmt( ## This is a special function to only format the numbers as % and leave the 'c's as is
      columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent),
      fns = function(x) {
        case_when(
          grepl("^-?\\d+(\\.\\d+)?$", x) ~ scales::percent(as.numeric(x), accuracy = 1),
          TRUE ~ x # Keep non-numeric values unchanged
        )
      }
    ) %>%
    fmt(
      columns = c(number_of_matched_learners),
      fns = function(x) {
        case_when(
          grepl("^-?\\d+(\\.\\d+)?$", x) ~ scales::number(as.numeric(x), big.mark = ","),
          TRUE ~ x # Keep non-numeric values unchanged
        )
      }
    ) %>%
    cols_label(
      time_period = md("**Academic Year**"),
      provider_name = md("**Provider name**"),
      number_of_matched_learners = md("**Number of matched learners**"),
      benefit_learner = md("**Benefit status of learner**"),
      spd_percent = md("**Sustained positive destination rate**"),
      emp_percent = md("**Percent in employment**"),
      learn_percent = md("**Percent in learning**"),
      no_dest_percent = md("**Percent with no destination**")
    ) %>%
    cols_align(
      align = c("left"),
      columns = c(time_period, provider_name)
    ) %>%
    cols_align(
      align = c("right"),
      columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent)
    ) %>%
    tab_style(
      style = cell_text(
        weight = "bold"
      ),
      locations = cells_row_groups()
    ) %>%
    # Styling to match GOV.UK table look
    tab_options(
      table.font.names = "Arial",
      table.border.top.color = "black",
      table.border.bottom.color = "black",
      column_labels.border.top.color = "black",
      column_labels.border.bottom.color = "black",
      row.striping.include_table_body = TRUE,
      row.striping.background_color = "#f3f2f1" # GOV.UK light grey for striped rows
    )


  return(formatted_table)
}

## This formats the 04 table
Formatting_04_table <- function(table_input) {
  formatted_table <- table_input %>%
    gt() %>%
    # fmt_percent(
    #   columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent),
    #   decimals = 0
    # ) %>%
    fmt( ## This is a special function to only format the numbers as % and leave the 'c's as is
      columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent),
      fns = function(x) {
        case_when(
          grepl("^-?\\d+(\\.\\d+)?$", x) ~ scales::percent(as.numeric(x), accuracy = 1),
          TRUE ~ x # Keep non-numeric values unchanged
        )
      }
    ) %>%
    fmt(
      columns = c(number_of_matched_learners),
      fns = function(x) { ## This is a special function to only format the numbers as % and leave the 'c's as is
        case_when(
          grepl("^-?\\d+(\\.\\d+)?$", x) ~ scales::number(as.numeric(x), big.mark = ","),
          TRUE ~ x # Keep non-numeric values unchanged
        )
      }
    ) %>%
    # fmt_number(
    #   columns = c(number_of_matched_learners),
    #   decimals = 0
    # ) %>%
    cols_label(
      time_period = md("**Academic Year**"),
      provider_name = md("**Provider name**"),
      number_of_matched_learners = md("**Number of matched learners**"),
      spd_percent = md("**Sustained positive destination rate**"),
      emp_percent = md("**Percent in employment**"),
      learn_percent = md("**Percent in learning**"),
      no_dest_percent = md("**Percent with no destination**")
    ) %>%
    cols_align(
      align = c("left"),
      columns = c(time_period, provider_name)
    ) %>%
    cols_align(
      align = c("right"),
      columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent)
    ) %>%
    tab_style(
      style = cell_text(
        weight = "bold"
      ),
      locations = cells_row_groups()
    ) %>%
    # Styling to match GOV.UK table look
    tab_options(
      table.font.names = "Arial",
      table.border.top.color = "black",
      table.border.bottom.color = "black",
      column_labels.border.top.color = "black",
      column_labels.border.bottom.color = "black",
      row.striping.include_table_body = TRUE,
      row.striping.background_color = "#f3f2f1" # GOV.UK light grey for striped rows
    )


  return(formatted_table)
}




## This formats the 04 for TOTAL provision table
Formatting_04_table_total <- function(table_input) {
  formatted_table <- table_input %>%
    gt() %>%
    # fmt_percent(
    #   columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent),
    #   decimals = 0
    # ) %>%
    fmt( ## This is a special function to only format the numbers as % and leave the 'c's as is
      columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent),
      fns = function(x) {
        case_when(
          grepl("^-?\\d+(\\.\\d+)?$", x) ~ scales::percent(as.numeric(x), accuracy = 1),
          TRUE ~ x # Keep non-numeric values unchanged
        )
      }
    ) %>%
    fmt(
      columns = c(number_of_matched_learners),
      fns = function(x) {
        case_when(
          grepl("^-?\\d+(\\.\\d+)?$", x) ~ scales::number(as.numeric(x), big.mark = ","),
          TRUE ~ x # Keep non-numeric values unchanged
        )
      }
    ) %>%
    cols_label(
      time_period = md("**Academic Year**"),
      provider_name = md("**Provider name**"),
      number_of_matched_learners = md("**Number of matched learners**"),
      provision = md("**Provision type**"),
      spd_percent = md("**Sustained positive destination rate**"),
      emp_percent = md("**Percent in employment**"),
      learn_percent = md("**Percent in learning**"),
      no_dest_percent = md("**Percent with no destination**")
    ) %>%
    cols_align(
      align = c("left"),
      columns = c(time_period, provider_name, provision)
    ) %>%
    cols_align(
      align = c("right"),
      columns = c(spd_percent, emp_percent, learn_percent, no_dest_percent)
    ) %>%
    tab_style(
      style = cell_text(
        weight = "bold"
      ),
      locations = cells_row_groups()
    ) %>%
    # Styling to match GOV.UK table look
    tab_options(
      table.font.names = "Arial",
      table.border.top.color = "black",
      table.border.bottom.color = "black",
      column_labels.border.top.color = "black",
      column_labels.border.bottom.color = "black",
      row.striping.include_table_body = TRUE,
      row.striping.background_color = "#f3f2f1" # GOV.UK light grey for striped rows
    )


  return(formatted_table)
}
