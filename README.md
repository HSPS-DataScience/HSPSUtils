# HSPS-Utils
Utility functions used at Henry Schien Data Science 

## Installation
* Ensure that devtools is installed: `install.packages("devtools")`
* Run: `install_github("HSPS-DataScience/HSPSUtils")` 
* Load HSPSUtils: `library(HSPSUtils)` 

## Updating
* If the package fails to load or function properly, make sure HSPSUtils is updated:
  + `devtools::update_packages("HSPSUtils")` will update the package to the current version 
  + `library(HSPSUtils)` to reload into session  
  + If neither options works, try restarting your R session 

## Package Structure 
* Functions should be put in separate R scripts with their function name as the title
  + E.g. `my_function.R` will contain the defintion of `my_function` only
* Unless there is theme or good reason why multiple functions should be put in the same file, leave them in separate files
  + For example: `filtering_functions.R` contains small functions which are useful when stringing together `dplyr` verbs
  + **Filtering functions are denoted by names starting with periods** (E.g. `.is_categorical_col`). 
