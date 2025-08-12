## This is the main script for the FEO provider dashboards

## This dashboard uses the publised Further Education Outcomes (FEO) data to visualise provider level data

## Toby Genborg, July 2025
## Stored on ADO in FEO_provider_dashboards
## App should be found on posit connect here:

## Must run these packages first
# install.packages(c("rsconnect", "renv", "dplyr", "tidyr", "tidyverse", "shiny", "shinydashboard", "gt", "here", "RODBC"))

library(rsconnect)
library(renv)
library(dplyr)
library(tidyr)
library(tidyverse)
library(shiny)
library(shinydashboard)
library(gt)
library(here)
library(RODBC)
# library(shinya11y) # Used to test the accessibility


## These next codes are to make the dashboard shareable. Every single time the code is changed, these two codes need to be re-run before pushing to ADO
# renv::snapshot() #has to do with the package versions
# rsconnect::writeManifest()  #needed to run the dashboard on R-connect

## Central code that runs everything in order

# Source your data and codes
source(here::here("R/read_sql_data.R"))
source(here::here("R/Suppress_functions.R"))
source(here::here("R/cleaning_data.R"))

# Run from here for debugging
source(here::here("global.R"))
source(here::here("R/Formatting_tables.R"))

# Source your ui panels
source(here::here("R/ui_panels/Headline_stats_UI.R"))
source(here::here("R/ui_panels/user_guide.R"))

source(here::here("server.R"))
source(here::here("ui.R"))

# Run the application
shinyApp(ui = ui, server = server)
