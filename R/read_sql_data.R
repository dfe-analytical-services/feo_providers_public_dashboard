## The intention of this script is to read the FEO data tables

## Manually set timeout to 3min not 1min to help load the large EES files.
options(timeout = 500)

# Read the PRV files directly from EES using the API link
# PRV01_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/de25b1da-f84d-45c3-970f-a2b4ef0ebba6/csv")
# PRV02_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/7eb4a567-be60-4140-9d65-a61a621ebfc2/csv")
# PRV03_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/76e2a5c4-5065-46fd-a95d-643bd4aa23c3/csv")
# PRV04_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/6e965508-af96-48d8-acce-d4eed1d14d15/csv")
# NAT01_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/869957da-6475-4010-b176-0f89695acf57/csv")
# NAT02_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/7b107a29-d155-4fe6-8d27-54f6e0849523/csv")
# QUA01_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/5dad3128-9c99-419c-9e84-8d24e0a58c16/csv")

## An older approach reading in the SQL files. This takes a long time, so run it once then save RDS files to the project area
# conn <- odbcDriverConnect("Driver=SQL Server; Server=T1PRMDRSQL\\SQLPROD,55842;")
# PRV01_data <- sqlQuery(conn, "SELECT * FROM MDR_Modelling_FE_OBSM_Development.OUTPUT.PRV01")
# PRV02_data <- sqlQuery(conn, "SELECT * FROM MDR_Modelling_FE_OBSM_Development.OUTPUT.PRV02")
# PRV03_data <- sqlQuery(conn, "SELECT * FROM MDR_Modelling_FE_OBSM_Development.OUTPUT.PRV03")
# PRV04_data <- sqlQuery(conn, "SELECT * FROM MDR_Modelling_FE_OBSM_Development.OUTPUT.PRV04")
# odbcClose(conn)

## Save the files for easier, faster access in the dashboard - but these are commented out as they've been run before
## Read the saved RDS files
# saveRDS(PRV01_data, "data/PRV01_data_rds.rds")
PRV01_data <- readRDS("data/PRV01_data_rds.rds")

# saveRDS(PRV02_data, "data/PRV02_data_rds.rds")
PRV02_data <- readRDS("data/PRV02_data_rds.rds")

# saveRDS(PRV03_data, "data/PRV03_data_rds.rds")
PRV03_data <- readRDS("data/PRV03_data_rds.rds")

# saveRDS(PRV04_data, "data/PRV04_data_rds.rds")
PRV04_data <- readRDS("data/PRV04_data_rds.rds")

# #saveRDS(NAT01_data, "data/NAT01_data_rds.rds")
# NAT01_data <- readRDS("data/NAT01_data_rds.rds")
#
# #saveRDS(NAT02_data, "data/NAT02_data_rds.rds")
# NAT02_data <- readRDS("data/NAT02_data_rds.rds")
#
# saveRDS(QUA01_data, "data/QUA01_data_rds.rds")
# QUA01_data <- readRDS("data/QUA01_data_rds.rds")
