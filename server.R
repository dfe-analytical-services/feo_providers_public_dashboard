# -----------------------------------------------------------------------------
# This is the server file.
#
# Use it to create interactive elements like tables, charts and text for your
# app.
#
# Anything you create in the server file won't appear in your app until you call
# it in the UI file. This server script gives examples of plots and value boxes
#
# There are many other elements you can add in too, and you can play around with
# their reactivity. The "outputs" section of the shiny cheatsheet has a few
# examples of render calls you can use:
# https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# -----------------------------------------------------------------------------
server <- function(input, output, session) {
  # Bookmarking ---------------------------------------------------------------
  # The template uses bookmarking to store input choices in the url. You can
  # exclude specific inputs (for example extra info created for a datatable
  # or plotly chart) using the list below, but it will need updating to match
  # any entries in your own dashboard's bookmarking url that you don't want
  # including.
  setBookmarkExclude(c(
    "cookies", "link_to_app_content_tab",
    "tabBenchmark_rows_current", "tabBenchmark_rows_all",
    "tabBenchmark_columns_selected", "tabBenchmark_cell_clicked",
    "tabBenchmark_cells_selected", "tabBenchmark_search",
    "tabBenchmark_rows_selected", "tabBenchmark_row_last_clicked",
    "tabBenchmark_state",
    "plotly_relayout-A",
    "plotly_click-A", "plotly_hover-A", "plotly_afterplot-A",
    ".clientValue-default-plotlyCrosstalkOpts"
  ))

  observe({
    # Trigger this observer every time an input changes
    reactiveValuesToList(input)
    session$doBookmark()
  })

  onBookmarked(function(url) {
    updateQueryString(url)
  })

  observe({
    if (input$navlistPanel == "Headline statistics") {
      change_window_title(
        session,
        paste0(
          site_title, " - ",
          input$selectUKPRN
        )
      )
    } else {
      change_window_title(
        session,
        paste0(
          site_title, " - ",
          input$navlistPanel
        )
      )
    }
  })

  # Cookies logic -------------------------------------------------------------
  output$cookies_status <- dfeshiny::cookies_banner_server(
    input_cookies = shiny::reactive(input$cookies),
    parent_session = session,
    google_analytics_key = google_analytics_key
  )

  dfeshiny::cookies_panel_server(
    input_cookies = shiny::reactive(input$cookies),
    google_analytics_key = google_analytics_key
  )


  output$table_01 <- render_gt({
    # Filter your data
    filtered_data <- PRV01_data %>%
      filter(
        provider_name == input$selectUKPRN,
        provision == input$selectProvision01
      ) %>%
      select(
        time_period, provider_name, benefit_learner, number_of_matched_learners,
        spd_percent, emp_percent, learn_percent, no_dest_percent
      ) %>%
      arrange(time_period, benefit_learner) %>%
      group_by(provider_name, time_period)

    # Check if there's no data
    if (nrow(filtered_data) == 0) {
      # Create a dummy gt table with a nice message
      gt(data.frame(Message = "⚠️ No matching data found, either due to combination of filters not being present in the data or insufficient sample sizes. Please adjust the filters.")) %>%
        tab_options(table.width = pct(100)) # optional styling
    } else {
      # Format normally if there is data
      Formatting_01_table(filtered_data)
    }
  })



  # Create a gt table for 02 data
  output$table_02 <- render_gt(if (input$selectLevel02 == "Total") {
    filtered_data <- PRV02_data %>%
      filter(
        provider_name == input$selectUKPRN,
        age_group == input$selectAgeGroup02,
        level_of_learning == input$selectLevel02,
        level_of_learning_group == "Total", ## For when user chooses level=Total then set this column also to Total, in order to avoid duplicates in output table
        provision == "Total", ## For when user chooses level=Total then set this column also to Total, in order to avoid duplicates in output table
        learning_difficulties == input$selectLLDD
      ) %>%
      select(time_period, provider_name, sex, number_of_matched_learners, spd_percent, emp_percent, learn_percent, no_dest_percent) %>%
      arrange(time_period, sex) %>%
      group_by(provider_name, time_period)

    # Check if there's no data
    if (nrow(filtered_data) == 0) {
      # Create a dummy gt table with a nice message
      gt(data.frame(Message = "⚠️ No matching data found, either due to combination of filters not being present in the data or insufficient sample sizes. Please adjust the filters.")) %>%
        tab_options(table.width = pct(100)) # optional styling
    } else {
      # Format normally if there is data
      Formatting_02_table(filtered_data)
    }
  } else { ## This is if the SelectLevel02 != Total

    filtered_data <- PRV02_data %>%
      filter(
        provider_name == input$selectUKPRN,
        age_group == input$selectAgeGroup02,
        level_of_learning == input$selectLevel02,
        learning_difficulties == input$selectLLDD
      ) %>%
      select(time_period, provider_name, sex, number_of_matched_learners, spd_percent, emp_percent, learn_percent, no_dest_percent) %>%
      arrange(time_period, sex) %>%
      group_by(provider_name, time_period)

    # Check if there's no data
    if (nrow(filtered_data) == 0) {
      # Create a dummy gt table with a nice message
      gt(data.frame(Message = "⚠️ No matching data found, either due to combination of filters not being present in the data or insufficient sample sizes. Please adjust the filters.")) %>%
        tab_options(table.width = pct(100)) # optional styling
    } else {
      # Format normally if there is data
      Formatting_02_table(filtered_data)
    }
  })


  # Create a gt table for 03 data
  output$table_03 <- render_gt({
    filtered_data <- PRV03_data %>%
      filter(
        provider_name == input$selectUKPRN,
        provision == input$selectProvision03,
        age_group == input$selectAgeGroup03
      ) %>%
      select(
        time_period, provider_name, benefit_learner, number_of_matched_learners,
        spd_percent, emp_percent, learn_percent, no_dest_percent
      ) %>%
      arrange(time_period, benefit_learner) %>%
      group_by(provider_name, time_period)


    # Check if there's no data
    if (nrow(filtered_data) == 0) {
      # Create a dummy gt table with a nice message
      gt(data.frame(Message = "⚠️ No matching data found, either due to combination of filters not being present in the data or insufficient sample sizes. Please adjust the filters.")) %>%
        tab_options(table.width = pct(100)) # optional styling
    } else {
      # Format normally if there is data
      Formatting_03_table(filtered_data)
    }
  })


  # # Create a gt table for 02 data
  # output$table_02 <- render_gt( if(input$selectAgeGroup == "Total"){    ## Do extra filter on the PRV02 data for when Total is selected for the AgeGroup
  #   Formatting_02_table(PRV02_data %>% filter(
  #     provider_name == input$selectUKPRN,
  #     age_group == input$selectAgeGroup,
  #     age_youth_adult == "Total",   ## Added for case when age_group is "Total" to not count the separate rows for "19+" and "18 and under"
  #     level_of_learning == input$selectLevel02,
  #     learning_difficulties == input$selectLLDD
  #   ) %>%
  #     select(time_period, provider_name, sex, age_youth_adult, level_of_learning_group, number_of_learners, spd_percent, emp_percent, learn_percent, no_dest_percent) %>%
  #     mutate(spd_percent = spd_percent/100, emp_percent = emp_percent/100, learn_percent = learn_percent/100, no_dest_percent = no_dest_percent/100) %>%
  #     arrange(time_period, sex) %>%
  #     group_by(provider_name, time_period)
  #   )
  # } else {
  #   Formatting_02_table(PRV02_data %>% filter(
  #     provider_name == input$selectUKPRN,
  #     age_group == input$selectAgeGroup,
  #     level_of_learning == input$selectLevel02,
  #     learning_difficulties == input$selectLLDD
  #   ) %>%
  #     select(time_period, provider_name, sex, level_of_learning_group, number_of_learners, spd_percent, emp_percent, learn_percent, no_dest_percent) %>%
  #     mutate(spd_percent = spd_percent/100, emp_percent = emp_percent/100, learn_percent = learn_percent/100, no_dest_percent = no_dest_percent/100) %>%
  #     arrange(time_period, sex) %>%
  #     group_by(provider_name, time_period)
  #   )
  # }
  # )

  #
  # # Create a gt table for 03 data
  # output$table_03 <- render_gt(
  #     Formatting_03_table(PRV03_data %>% filter(
  #       provider_name == input$selectUKPRN,
  #       ssa_tier_1 == input$selectSSA1
  #       ) %>%
  #     select(time_period, provider_name, number_of_learners, spd_percent, emp_percent, learn_percent, no_dest_percent)
  #     )
  #   )

  # Create a gt table for 04 data
  output$table_04 <- render_gt({
    if (input$selectLevel04 == "Total") {
      filtered_data <- PRV04_data %>%
        filter( ## Use the TOTAL version of this formatting function
          provider_name == input$selectUKPRN,
          ssa_tier_1 == input$selectSSA1,
          level_of_learning == input$selectLevel04
        ) %>%
        select(time_period, provider_name, provision, number_of_matched_learners, spd_percent, emp_percent, learn_percent, no_dest_percent) %>%
        arrange(time_period, provision) %>%
        group_by(provider_name, time_period)

      # Check if there's no data
      if (nrow(filtered_data) == 0) {
        # Create a dummy gt table with a nice message
        gt(data.frame(Message = "⚠️ No matching data found, either due to combination of filters not being present in the data or insufficient sample sizes. Please adjust the filters.")) %>%
          tab_options(table.width = pct(100)) # optional styling
      } else {
        # Format normally if there is data
        Formatting_04_table_total(filtered_data)
      }
    } else { ## If SelectLevel04 != Total

      filtered_data <- PRV04_data %>%
        filter(
          provider_name == input$selectUKPRN,
          ssa_tier_1 == input$selectSSA1,
          level_of_learning == input$selectLevel04
        ) %>%
        select(time_period, provider_name, number_of_matched_learners, spd_percent, emp_percent, learn_percent, no_dest_percent) %>%
        arrange(time_period) %>%
        group_by(provider_name, time_period)

      # Check if there's no data
      if (nrow(filtered_data) == 0) {
        # Create a dummy gt table with a nice message
        gt(data.frame(Message = "⚠️ No matching data found, either due to combination of filters not being present in the data or insufficient sample sizes. Please adjust the filters.")) %>%
          tab_options(table.width = pct(100)) # optional styling
      } else {
        # Format normally if there is data
        Formatting_04_table(filtered_data)
      }
    }
  })




  # Link in the user guide panel back to the main panel -----------------------
  observeEvent(input$link_to_app_content_tab, {
    updateTabsetPanel(session, "navlistPanel", selected = "Headline statistics")
  })

  # Download the underlying data button --------------------------------------
  output$download_data_01 <- downloadHandler(
    filename = "PRV01_data_Further_Education_Outcomes.csv",
    content = function(file) {
      write.csv(PRV01_data, file)
    }
  )

  # Download the underlying data button --------------------------------------
  output$download_data_02 <- downloadHandler(
    filename = "PRV02_data_Further_Education_Outcomes.csv",
    content = function(file) {
      write.csv(PRV02_data, file)
    }
  )

  # Download the underlying data button --------------------------------------
  output$download_data_03 <- downloadHandler(
    filename = "PRV03_data_Further_Education_Outcomes.csv",
    content = function(file) {
      write.csv(PRV03_data, file)
    }
  )

  # Download the underlying data button --------------------------------------
  output$download_data_04 <- downloadHandler(
    filename = "PRV04_data_Further_Education_Outcomes.csv",
    content = function(file) {
      write.csv(PRV04_data, file)
    }
  )

  # Dynamic label showing custom selections -----------------------------------
  output$dropdown_label <- renderText({
    paste0("Current selections: ", input$selectUKPRN)
  })

  # Stop app ------------------------------------------------------------------
  session$onSessionEnded(function() {
    stopApp()
  })
}
