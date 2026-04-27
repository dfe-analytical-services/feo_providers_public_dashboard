## The intention of this script is to read the FEO data tables

## Manually set timeout to 3min not 1min to help load the large EES files.

source_ees_data_files <- function() {
  options(timeout = 500)

  source_files <- list(
    PRV01_data = "https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/9e38d037-c2d3-4c1b-9773-2f443e6c59ae/csv",
    PRV02_data = "https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/6baf212e-0348-4390-8d4e-e286c5a6630f/csv",
    PRV03_data = "https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/240cbdfc-1421-49f6-b376-7de4212530d6/csv",
    PRV04_data = "https://explore-education-statistics.service.gov.uk/data-catalogue/data-set/05ad6dc2-9f53-425e-90ef-833f043b9d14/csv"
  )

  for (data_set_name in names(source_files)) {
    local_data_file <- paste0("data/", data_set_name, ".rds")
    if (!file.exists(local_data_file)) {
      message(
        local_data_file,
        " not found. Now downloading from EES publication."
      )
      data_set <- read.csv(source_files[[data_set_name]])
      cleaned_data_set <- data_set |>
        clean_data(data_set_name)
      saveRDS(cleaned_data_set, local_data_file)
      message("Finished downloading (and cleaning) ", local_data_file)
    }
  }
}

# Read in data
read_data_files <- function() {
  message("Reading in data files...")
  PRV01_data <- readRDS("data/PRV01_data.rds")
  PRV02_data <- readRDS("data/PRV02_data.rds")
  PRV03_data <- readRDS("data/PRV03_data.rds")
  PRV04_data <- readRDS("data/PRV04_data.rds")
  message("Finished reading in data files.")
  list(
    prv01 = PRV01_data,
    prv02 = PRV02_data,
    prv03 = PRV03_data,
    prv04 = PRV04_data
  )
}
