# -----------------------------------------------------------------------------
# This is the global file.
#
# Use it to store functions, library calls, source files etc.
#
# Moving these out of the server file and into here improves performance as the
# global file is run only once when the app launches and stays consistent
# across users whereas the server and UI files are constantly interacting and
# responsive to user input.
#
# Library calls ---------------------------------------------------------------
shhh <- suppressPackageStartupMessages # It's a library, so shhh!

# Core shiny and R packages
shhh(library(shiny))
shhh(library(bslib))
shhh(library(rstudioapi))

# Custom packages
shhh(library(dfeR))
shhh(library(dfeshiny)) ## if this doesn't exist for you, try run this instead: renv::install("dfe-analytical-services/dfeshiny")
shhh(library(shinyGovstyle))

# Creating charts and tables
shhh(library(ggplot2))
shhh(library(DT))

# Data and string manipulation
shhh(library(dplyr))
shhh(library(stringr))
shhh(library(ggiraph))

# Shiny extensions
shhh(library(shinyjs))
shhh(library(tools))
shhh(library(shinydashboard))
shhh(library(shinyWidgets))
shhh(library(shinytitle))
shhh(library(xfun))
shhh(library(metathis))
shhh(library(shinyalert))

# Dependencies needed for testing or CI but not for the app -------------------
# Including them here keeps them in renv but avoids the app needlessly loading
# them, saving on load time.
if (FALSE) {
  shhh(library(shinytest2))
  shhh(library(testthat))
}

# Source scripts --------------------------------------------------------------

# Source any scripts here. Scripts may be needed to process data before it gets
# to the server file or to hold custom functions to keep the main files shorter
#
# It's best to do this here instead of the server file, to improve performance.


# Source all files in the ui_panels folder
lapply(list.files("R/ui_panels/", full.names = TRUE), source)

# Set global variables --------------------------------------------------------

site_title <- "Department for Education (DfE) Further Education Outcomes Provider data" # name of app
parent_pub_name <- "Further Education Outcomes" # name of source publication
parent_publication <- # link to source publication
  "https://explore-education-statistics.service.gov.uk/find-statistics/further-education-outcomes/2021-22"

# Set the URLs that the site will be published to
site_primary <- "https://department-for-education.shinyapps.io/dfe-shiny-template/"
site_overflow <- "https://department-for-education.shinyapps.io/dfe-shiny-template-overflow/"

# This function is needed for the Shiny App
expandable <- function(input_id, label, contents) {
  gov_details <- shiny::tags$details(
    class = "govuk-details", id = input_id,
    shiny::tags$summary(
      class = "govuk-details__summary",
      shiny::tags$span(
        class = "govuk-details__summary-text",
        label
      )
    ),
    shiny::tags$div(contents)
  )
}

# Combine URLs into list for disconnect function
# We can add further mirrors where necessary. Each one can generally handle
# about 2,500 users simultaneously
sites_list <- c(site_primary, site_overflow)

# Set the key for Google Analytics tracking
google_analytics_key <- "Z967JJVQQX"

# End of global variables -----------------------------------------------------

# Enable bookmarking so that input choices are shown in the url ---------------
enableBookmarking("url")

# List of UKPRNs
choices_UKPRNs <- sort(unique(PRV01_data$provider_name)) # All PRV0 files should have the same list of UKPRNs, so just use 01 here.

# List of SSA1s
choices_SSA1 <- sort(unique(PRV04_data$ssa_tier_1))
choices_SSA1 <- c("Total", choices_SSA1[choices_SSA1 != "Total"]) ## Set Total to defaul, front position

# List of Provision types
choices_Provision01 <- sort(unique(PRV01_data$provision))
choices_Provision01 <- c("Total", choices_Provision01[choices_Provision01 != "Total"]) ## Set Total to defaul, front position

choices_Provision03 <- sort(unique(PRV03_data$provision))
choices_Provision03 <- c("Total", choices_Provision03[choices_Provision03 != "Total"]) ## Set Total to defaul, front position

# List of Age Groups
choices_AgeGroup02 <- sort(unique(PRV02_data$age_group))
choices_AgeGroup02 <- c("Total", choices_AgeGroup02[choices_AgeGroup02 != "Total"]) ## Set Total to defaul, front position

choices_AgeGroup03 <- sort(unique(PRV03_data$age_group))
choices_AgeGroup03 <- c("Total", choices_AgeGroup03[choices_AgeGroup03 != "Total"]) ## Set Total to defaul, front position

# List of Levels for PRV02
choices_Levels02 <- sort(unique(PRV02_data$level_of_learning))
choices_Levels02 <- c("Total", choices_Levels02[choices_Levels02 != "Total"]) ## Set Total to defaul, front position

choices_Levels04 <- sort(unique(PRV04_data$level_of_learning))
choices_Levels04 <- c("Total", choices_Levels04[choices_Levels04 != "Total"]) ## Set Total to defaul, front position

# List of LLDD
choices_LLDD <- sort(unique(PRV02_data$learning_difficulties))
choices_LLDD <- c("Total", choices_LLDD[choices_LLDD != "Total"]) ## Set Total to defaul, front position
