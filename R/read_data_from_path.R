#' Read in any data from a file path provided by the user
#'
#' @import dplyr readr stringr
#' @return a tibble with the read in data
#' @export
read_data_from_path <- function() {
  path <- readline("Please enter the file path to your data: ")

  patterns <- c(".*\\.csv", ".*\\.txt", ".*\\.rds") # regex tests any number of characters before file name
  funcs <- c(read_csv, read_table, read_rds)        # IMPORTANT: match the readr function with the file type

  data <- NULL
  for (i in seq(length(patterns))) {
    if(str_detect(string = path, pattern = patterns[i])) {
      data <- funcs[i][[1]](path)
    }
  }

  as.tibble(data)
}
