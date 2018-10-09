#' Splits all columns of same type into n groups (3 by default). Useful for
#'   datasets with large numbers of variables and observations. Allows easier
#'   exploration on heavier visualizations across groups of variables.
#'
#' @param data a tibble
#' @param n number of groups to split by
#' @param data_type
#' @return a vector of grouped column names of the same type
#' @example
#' for (col_names in split_type_colnames_by_num(mtcars, data_type = is.numeric)) {
#'   mtcars %>%
#'     select(col_names) %>%
#'     gather_group_by_count() %>%
#'     print()
#' }
split_type_colnames_by_num <- function(data, n = 3, data_type = .is_categorical_col) {
  data_colnames <- data %>%
    select_if(data_type) %>%
    colnames()

  # without num_groups split() will return only n groups, not groups of n length
  num_groups <- length(data_colnames) %/% n
  split(data_colnames, cut(seq_along(data_colnames), num_groups, labels = FALSE))
}
