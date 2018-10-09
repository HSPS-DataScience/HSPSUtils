#' dplyr::sample_n lacks the functionality of sampling group_by variables. Instead,
#'   it is only capable of sampling rows in a table. sample_n_groups() samples a
#'   number of groups in a previously grouped_by tibble. **the tibble must be grouped
#'   before calling the function**.
#'
#' @param tbl A tibble
#' @param size number of groups to sample
#' @param replace sample with or without replacement
#' @param weight sampling weights
#' @return A tibble
#' @import dplyr
#' @export
#' @example
#' # this is an arbitrary example
#' mtcars %>%
#'   group_by(mpg, am, gear, carb) %>%
#'   sample_n_groups(2)
#'
#'   A tibble: 3 x 11
#'   Groups:   cyl, am, gear, carb [2]
#'     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#'   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#' 1    21     6   160   110  3.9   2.62  16.5     0     1     4     4
#' 2    21     6   160   110  3.9   2.88  17.0     0     1     4     4
#' 3    15     8   301   335  3.54  3.57  14.6     0     1     5     8

sample_n_groups <- function(tbl, size, replace = FALSE, weight = NULL) {
  # regroup when done
  grps <- tbl %>%
    groups() %>%
    lapply(as.character) %>%
    unlist()
  # check length of groups non-zero
  keep <- tbl %>%
    summarise() %>%
    ungroup() %>%
    sample_n(size, replace, weight)
  # keep only selected groups, regroup because joins change count.
  # regrouping may be unnecessary but joins do something funky to grouping variable
  tbl %>%
    right_join(keep, by = grps) %>%
    group_by_(.dots = grps)
}
