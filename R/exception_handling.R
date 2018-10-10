#' safely handle errors and warnings in any given function
#'
#' @param expr an expression or function
#' @export
handle_exceptions <- function(expr) {
  tryCatch(
    expr,
    error = function(e){
      message("An error occurred:\n", e)
    },
    warning = function(w){
      message("A warning occured:\n", w)
    })
}
