## suppress small sample sizes


suppressProvProgression <- function(x) {
  # Check x is a dataframe, otherwise return error
  if ((!is.data.frame(x)) || NROW(x) == 0) {
    return("x must be a populated data frame.")
  }

  # Get a list of all column names
  allColumns <- colnames(x)

  # Get the column number for the 'Number of learners' column which should be the first numeric column
  firstNumCol <- grep("number_of_matched_learners", allColumns)

  # For any rows where the number of matched learners is below 6 suppress all numeric columns (-9)
  x[x[, firstNumCol + 1] < 6, c(firstNumCol:NCOL(x))] <- -9

  # get the column numbers of all columns with 'Percent' in the title (all the percentage columns should)
  percentColumns <- grep("percent", allColumns)
  # percentColumns <- percentColumns[3:length(percentColumns)]

  # For each percentage column, if the column before it is less than 3, suppress that value to -9
  for (i in percentColumns) {
    x[x[, (i - 1)] < 3 & x[, (i - 1)] > 0, i] <- -9
  }

  frontNumCols <- c(1:firstNumCol)
  # mainCohortCol <- firstNumCol

  finalCols <- c(frontNumCols, percentColumns)

  # Round the number of learners and number of matched learner columns to nearest 10
  x[x[, firstNumCol] != -9, c(firstNumCol)] <- round(x[x[, firstNumCol] != -9, c(firstNumCol)], -1)

  y <- x[, finalCols]
  firstMissingCol <- grep("number_of_matched_learners", colnames(y))
  y[, firstMissingCol:NCOL(y)] <- sapply(y[, firstMissingCol:NCOL(y)], as.numeric)

  y[, firstMissingCol:NCOL(y)][is.na(y[, firstMissingCol:NCOL(y)])] <- "z"
  # y[is.na(y[firstMissingCol:NCOL(y)]),firstMissingCol:NCOL(y)] <- '.'
  y[y == -9] <- "c"
  return(y)
}
