Headline_stats_panel <- function() {
  tabPanel(
    "Headline statistics",
    gov_main_layout(
      gov_row(
        column(
          width = 12,
          id = "main_col",
          h1("Outcomes per specific provider"),
        ),
        # Expandable section --------------------------------------------------
        column(
          width = 12,
          div(
            id = "div_a",
            # User selection dropdowns ------------------------------------
            gov_row(
              column(
                width = 8,
                shinyGovstyle::select_Input(
                  inputId = "selectUKPRN",
                  label = "Select a Provider",
                  select_text = choices_UKPRNs,
                  select_value = choices_UKPRNs
                )
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
              fluidRow(
                br(),
                column(
                  width = 6,
                  shinyGovstyle::select_Input(
                    inputId = "selectSSA1",
                    label = "Select a Sector Subject Area (Tier 1):",
                    select_text = choices_SSA1,
                    select_value = choices_SSA1
                  )
                ),
                column(
                  width = 6,
                  shinyGovstyle::select_Input(
                    inputId = "selectLevel04",
                    label = "Select a Level/provision type:",
                    select_text = choices_Levels04,
                    select_value = choices_Levels04
                  )
                ),
                br(),
                column(
                  width = 12,
                  h2("Sector Subject Area data"),
                  fluidRow(
                    column(
                      width = 12,
                      tableOutput("table_04")
                    )
                  )
                ),
                column(
                  width = 12,
                  br(),
                  column(
                    width = 12,
                    paste("Note: Education and Training relates to classroom based provision that is not
                            either community/tailored learning, an apprenticeship, or a traineeship."),
                    br(), br(),
                    paste("All suppressed numbers are represented by 'c' where sample sizes are too low."),
                    br(),
                  )
                ),
                column(
                  width = 12,
                  br(),
                  expandable(
                    input_id = "download04", label = "Download this data",
                    contents =
                    # Download button -------------------------------------------
                      column(
                        width = 12,
                        paste("Download the underlying data for this dashboard:"),
                        br(),
                        downloadButton(
                          outputId = "download_data_04",
                          label = "Download data",
                          icon = shiny::icon("download"),
                          class = "downloadButton"
                        )
                      )
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
                  shinyGovstyle::select_Input(
                    inputId = "selectAgeGroup02",
                    label = "Select age group:",
                    select_text = choices_AgeGroup02,
                    select_value = choices_AgeGroup02
                  )
                ),
                column(
                  width = 6,
                  shinyGovstyle::select_Input(
                    inputId = "selectLevel02",
                    label = "Select Level/provision type:",
                    select_text = choices_Levels02,
                    select_value = choices_Levels02
                  )
                ),
                br(),
                column(
                  width = 6,
                  shinyGovstyle::select_Input(
                    inputId = "selectLLDD",
                    label = "Select learning difficulties group:",
                    select_text = choices_LLDD,
                    select_value = choices_LLDD
                  )
                ),
                br(),
                column(
                  width = 12,
                  h2("Demographics table data"),
                  fluidRow(
                    column(
                      width = 12,
                      tableOutput("table_02")
                    )
                  )
                ),
                column(
                  width = 12,
                  br(),
                  column(
                    width = 12,
                    paste("Note: All suppressed numbers are represented by 'c' where sample sizes are too low."),
                    br(),
                  )
                ),
                column(
                  width = 12,
                  br(),
                  expandable(
                    input_id = "download02", label = "Download this data",
                    contents =
                    # Download button -------------------------------------------
                      column(
                        width = 12,
                        paste("Download the underlying data for this dashboard:"),
                        br(),
                        downloadButton(
                          outputId = "download_data_02",
                          label = "Download data",
                          icon = shiny::icon("download"),
                          class = "downloadButton"
                        )
                      )
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
                  shinyGovstyle::select_Input(
                    inputId = "selectProvision01",
                    label = "Select a provision type:",
                    select_text = choices_Provision01,
                    select_value = choices_Provision01
                  )
                ),
                column(
                  width = 12,
                  h2("Benefit learners table data"),
                  fluidRow(
                    column(
                      width = 12,
                      tableOutput("table_01")
                    )
                  )
                ),
                column(
                  width = 12,
                  br(),
                  column(
                    width = 12,
                    paste("Note: All suppressed numbers are represented by 'c' where sample sizes are too low."),
                    br(),
                  )
                ),
                column(
                  width = 12,
                  br(),
                  expandable(
                    input_id = "download01", label = "Download this data",
                    contents =
                    # Download button -------------------------------------------
                      column(
                        width = 12,
                        paste("Download the underlying data for this dashboard:"),
                        br(),
                        downloadButton(
                          outputId = "download_data_01",
                          label = "Download data",
                          icon = shiny::icon("download"),
                          class = "downloadButton"
                        )
                      )
                  )
                )
              ) # closes fluidRow
            ), # closes specific tabPanel
            # 03 tab --------------------------------------------------
            tabPanel(
              "Community Learning Status",
              fluidRow(
                br(),
                column(
                  width = 4,
                  shinyGovstyle::select_Input(
                    inputId = "selectProvision03",
                    label = "Select a provision type:",
                    select_text = choices_Provision03,
                    select_value = choices_Provision03
                  )
                ),
                column(
                  width = 4,
                  shinyGovstyle::select_Input(
                    inputId = "selectAgeGroup03",
                    label = "Select age group:",
                    select_text = choices_AgeGroup03,
                    select_value = choices_AgeGroup03
                  )
                ),
                column(
                  width = 12,
                  h2("Community Learners data"),
                  fluidRow(
                    column(
                      width = 12,
                      tableOutput("table_03")
                    )
                  )
                ),
                column(
                  width = 12,
                  br(),
                  column(
                    width = 12,
                    paste("Note: All suppressed numbers are represented by 'c' where sample sizes are too low."),
                    br(),
                  )
                ),
                column(
                  width = 12,
                  br(),
                  expandable(
                    input_id = "download03", label = "Download this data",
                    contents =
                    # Download button -------------------------------------------
                      column(
                        width = 12,
                        paste("Download the underlying data for this dashboard:"),
                        br(),
                        downloadButton(
                          outputId = "download_data_03",
                          label = "Download data",
                          icon = shiny::icon("download"),
                          class = "downloadButton"
                        )
                      )
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
