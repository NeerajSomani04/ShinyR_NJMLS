library(shinydashboard)
library(shiny)
library(DT)
library(googleVis)
library(leaflet)
library(RJSONIO)
library(jsonlite)

## Loading required package: RJSONIO
njmls_data <- fromJSON('cleaned_njmls_data.json')

# Secondly we can unlist the json_file as following:
njmls_data <- lapply(njmls_data, function(x) {
  x[sapply(x, is.null)] <- NA
  unlist(x)
})

# And finally we can join the unlisted columns in one data frame
njmls_df <- as.data.frame(do.call("cbind", njmls_data))


#njmls_df <- fromJSON('cleaned_njmls_df.json')

# Get rid of unwanted columns

njmls_df$address=NULL
njmls_df$'mls#'=NULL
njmls_df$basement=NULL
njmls_df$rooms=NULL
njmls_df$garage=NULL
njmls_df$monthly_maintenance=NULL
njmls_df$list_date=NULL

#Vector for Select input for the Map selector
njmls_df$'current_price' = as.double(njmls_df$'current_price')
