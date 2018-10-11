#' handle exceptions: decorator
#'   safely handle errors and warnings in any given function by applying
#'   decorator to function
#'
#' @param expr an expression or function
#' @export
#' @example
#' test_functions <- handle_exceptions %decorates% function() {
#'   1 + "two" # returns an error
#' }
#'
#' With the decorator, the function will now return the custom error message in
#' handle_exceptions, plus the normal error, and will exit the function gracefully.
handle_exceptions <- function(f) {
  function(...) {
    result = tryCatch(
      expr = f(...),
      error = function(e) {
        message("An error occurred:\n", e)
      },
      warning = function(w) {
        message("A warning occured:\n", w)
      },
      finally = function(n) {
        message("Finally:\n\n", n)
      }
    )

    return(result)
  }
}

#' Defines a generic decorator to be used by other closures (or functions within functions).
#'   Reference http://weinstockj.github.io/blog/2016/06/08/decorators-in-r/ for more information.
#'   Decorators are a concept which is borrowed from Python. In Python, they are built into the
#'   language, but in R we must first define a Decorator operator just as this one. handle_exceptions()
#'   is a function which is meant to decorate other functions.
#'
#' @param decorator a function to decorate another function
#' @param f a function which is decorated
#' @export
#' @example
#' test_functions <- handle_exceptions %decorates% function() {
#'   1 + "two" # returns an error
#' }
#'
#' With the decorator, the function will now return the custom error message in
#' handle_exceptions, plus the normal error, and will exit the function gracefully.
`%decorates%` <- function(decorator, f) {
  decorator(f)
}
