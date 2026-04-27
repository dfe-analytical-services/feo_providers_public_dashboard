Headline_stats_panel <- function() {
  tabPanel(
    "Headline statistics",
    gov_main_layout(
      gov_row(
        column(
          width = 12,
          id = "main_col",
          heading_text("Outcomes by specific provider", level = 1, size = "l"),
        ),
        # Expandable section --------------------------------------------------
        column(
          width = 12,
          div(
            id = "div_a",
            # User selection dropdowns ------------------------------------
            gov_row(
              layout_column_wrap(
                selectizeInput(
                  inputId = "selectUKPRN",
                  label = "Select a Provider",
                  choices_UKPRNs
                ),
                col_width = c(10)
              )
            )
          )
        ),
        # Tabset under dropdowns ----------------------------------------------
        column(
          width = 12,
          tabsetPanel(
            id = "tabsetpanels",
            # 04 tab -------------------------------------------------
            tabPanel(
              "Sector Subject Area",
              gov_row(
                br(),
                layout_column_wrap(
                  selectizeInput(
                    inputId = "selectSSA1",
                    label = "Select a Sector Subject Area (Tier 1):",
                    choices_SSA1
                  ),
                  selectizeInput(
                    inputId = "selectLevel04",
                    label = "Select a Level/provision type:",
                    choices_Levels04
                  ),
                  col_widths = c(6, 6)
                ),
                br(),
                column(
                  width = 12,
                  heading_text(
                    "Sector Subject Area data",
                    level = 2,
                    size = "m"
                  ),
                  fluidRow(
                    column(
                      width = 12,
                      tableOutput("table_04")
                    )
                  )
                ),
                column(
                  width = 12,
                  gov_text(
                    "Note: Education and Training relates to classroom based provision that is not
                            either community/tailored learning, an apprenticeship, or a traineeship."
                  ),
                  gov_text(
                    "All suppressed numbers are represented by 'c' where sample sizes are too low."
                  ),
                ),
                column(
                  width = 12,
                  # Download button -------------------------------------------
                  download_button(
                    outputId = "download_data_04",
                    button_label = "Download underlying data",
                    file_type = "CSV",
                    file_size = "139 MB"
                  )
                )
              ) # closes fluidRow
            ), # closes specific tabPanel
            # 02 Tab --------------------------------------------------
            tabPanel(
              "Demographics",
              fluidRow(
                br(),
                column(
                  width = 6,
                  selectizeInput(
                    inputId = "selectAgeGroup02",
                    label = "Select age group:",
                    choices_AgeGroup02
                  )
                ),
                column(
                  width = 6,
                  selectizeInput(
                    inputId = "selectLevel02",
                    label = "Select Level/provision type:",
                    choices_Levels02
                  )
                ),
                br(),
                column(
                  width = 6,
                  selectizeInput(
                    inputId = "selectLLDD",
                    label = "Select learning difficulties group:",
                    choices_LLDD
                  )
                ),
                br(),
                column(
                  width = 12,
                  heading_text(
                    "Demographics table data",
                    level = 2,
                    size = "m"
                  ),
                  fluidRow(
                    column(
                      width = 12,
                      tableOutput("table_02")
                    )
                  )
                ),
                column(
                  width = 12,
                  gov_text(
                    "Note: All suppressed numbers are represented by 'c' where sample sizes are too low."
                  ),
                ),
                column(
                  width = 12,
                  download_button(
                    outputId = "download_data_02",
                    button_label = "Download underlying data",
                    file_type = "CSV",
                    file_size = "47 MB"
                  )
                )
              ) # closes fluidRow
            ), # closes specific tabPanel
            # 01 tab --------------------------------------------------
            tabPanel(
              "Benefit Status",
              fluidRow(
                br(),
                column(
                  width = 4,
                  selectizeInput(
                    inputId = "selectProvision01",
                    label = "Select a provision type:",
                    choices_Provision01
                  )
                ),
                column(
                  width = 12,
                  heading_text(
                    "Benefit learners table data",
                    level = 2,
                    size = "m"
                  ),
                  fluidRow(
                    column(
                      width = 12,
                      tableOutput("table_01")
                    )
                  )
                ),
                column(
                  width = 12,
                  gov_text(
                    "Note: All suppressed numbers are represented by 'c' where sample sizes are too low."
                  ),
                ),
                column(
                  width = 12,
                  download_button(
                    outputId = "download_data_01",
                    button_label = "Download underlying data",
                    file_type = "CSV",
                    file_size = "14 MB"
                  )
                )
              ) # closes fluidRow
            ), # closes specific tabPanel
            # 03 tab --------------------------------------------------
            tabPanel(
              "Community Learning",
              fluidRow(
                br(),
                column(
                  width = 4,
                  selectizeInput(
                    inputId = "selectProvision03",
                    label = "Select a provision type:",
                    choices_Provision03
                  )
                ),
                column(
                  width = 4,
                  selectizeInput(
                    inputId = "selectAgeGroup03",
                    label = "Select age group:",
                    choices_AgeGroup03
                  )
                ),
                column(
                  width = 12,
                  heading_text(
                    "Community Learners data",
                    level = 2,
                    size = "m"
                  ),
                  fluidRow(
                    column(
                      width = 12,
                      tableOutput("table_03")
                    )
                  )
                ),
                column(
                  width = 12,
                  gov_text(
                    "Note: All suppressed numbers are represented by 'c' where sample sizes are too low."
                  ),
                ),
                column(
                  width = 12,
                  download_button(
                    outputId = "download_data_03",
                    button_label = "Download underlying data",
                    file_type = "CSV",
                    file_size = "18 MB"
                  )
                )
              ) # closes fluidRow
            ) # closes specific tabPanel
          ) # closes tabSetPanel
        ) # closes column
      ) # closes govrow()
    ) # closes govMainLayout()
  ) # closes tabPanel
} # closes function
