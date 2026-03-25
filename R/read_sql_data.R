## The intention of this script is to read the FEO data tables

## Manually set timeout to 3min not 1min to help load the large EES files.
options(timeout = 500)

# Read the PRV files directly from EES using the API link (new 2022/23 data). Current dashboard does not use NAT or QUA files as they're too big
# PRV01_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/9e38d037-c2d3-4c1b-9773-2f443e6c59ae/csv") 
# PRV02_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/6baf212e-0348-4390-8d4e-e286c5a6630f/csv") 
# PRV03_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/240cbdfc-1421-49f6-b376-7de4212530d6/csv") 
# PRV04_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/05ad6dc2-9f53-425e-90ef-833f043b9d14/csv") 
# NAT01_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/6bc60e9e-493a-4445-ae48-9cd3a5717e6b/csv") 
# NAT02_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/142ef7be-1714-4dec-96a4-1389c5840010/csv") 
# QUA01_data <- read.csv("https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/30c829a3-5de5-4d37-ad08-17d3840ec4d2/csv") 

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
# 
# saveRDS(PRV02_data, "data/PRV02_data_rds.rds")
# 
# saveRDS(PRV03_data, "data/PRV03_data_rds.rds")
# 
# saveRDS(PRV04_data, "data/PRV04_data_rds.rds")

# #saveRDS(NAT01_data, "data/NAT01_data_rds.rds")
# NAT01_data <- readRDS("data/NAT01_data_rds.rds")
#
# #saveRDS(NAT02_data, "data/NAT02_data_rds.rds")
# NAT02_data <- readRDS("data/NAT02_data_rds.rds")
#
# saveRDS(QUA01_data, "data/QUA01_data_rds.rds")
# QUA01_data <- readRDS("data/QUA01_data_rds.rds")
