#' Checks column data type for either character or factor (a categorical variable)
#'
#' @param col a column of data (vector)
#' @return Boolean
#' @example
#' mtcars %>%
#'   select_if(.is_categorical_col)
.is_categorical_col <- function(col) {
  is.character(col) | is.factor(col)
}

#' In some cases, it is important to exclude ID variables from datasets. .select_non_id_columns()
#'   takes a tibble and selects only column names which do not mention as being IDs. This is
#'   useful when an ID column is interpreted as a character variable and not numeric.
#'
#' @param data a tibble
#' @return a tibble
.select_non_id_columns <- function(data) {
  data %>%
    select(-contains("id"))
}



