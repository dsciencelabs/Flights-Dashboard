library(shiny)                   # this packages is use for Shiny App
library(shinydashboard)          # this packages is use for Shiny Dashboard

library(dplyr)                   # this packages is use for data preparation (edit, remove, mutate, etc)
library(stringr)                 # all functions deal with "NA"'s and zero length vectors
library(purrr)                   # requirement packages for Functional Programming Tools
library(rlang)                   # requirement packages for Rmarkdown

library(DT)                      # interface to the JavaScript library DataTables (https://datatables.net/)
library(r2d3)                    # D3 visualization

library(nycflights13)            # all flights that departed from NYC in 2013

# Use purrr's split() and map() function to create the list
# needed to display the name of the airline but pass its
# Carrier code as the value

airline_list <- airlines %>%
  collect() %>%
  split(.$name) %>%
  map(~ .$carrier)

# Use rlang's set_names() to easily create a valide "choices"
# argument of the dropdown where the displayed text has to be
# different than the value passed as the input selection

month_list <- as.list(1:12) %>%
  set_names(month.name)

month_list$`All Year` <- 99


