library(shiny)                            # this packages is use for Shiny App
library(shinydashboard)                   # this packages is use for Shiny Dashboard

library(dplyr)                            # this packages is use for data preparation (edit, remove, mutate, etc)
library(stringr)                          # all functions deal with "NA"'s and zero length vectors
library(purrr)                            # requirement packages for Functional Programming Tools
library(rlang)                            # requirement packages for Rmarkdown

library(DT)                               # interface to the JavaScript library DataTables (https://datatables.net/)
library(r2d3)                             # D3 visualization

library(DBI)                              # this packages is use for Database System (DBS)
library(dbplyr)                           # this packages is use for Database System (DBS)
library(RSQLite)                          # this packages is use for Database System (DBS)
library(RMySQL)                           # this packages is use to connect MySQL() 

con <- dbConnect(MySQL(),
                 user='factory',                        # please input your user account
                 password='ApaAjaBoleh',                # please input your password
                 dbname='factory',                      # please input your dbname
                 host='www.db4free.net')                # Conneting R to your hosting

# Note: Don't forget to run the following code (just for the first time) 
# On your server run " SET GLOBAL local_infile = true " and possibly restart server
# ----------------------------------------------------------------------

# airlines=read.csv('airlines.csv', header = T,sep = ",")  # read data from your PC
# airports=read.csv('airports.csv', header = T,sep = ",")  # read data from your PC
# flights=read.csv('flights.csv', header = T,sep = ",")    # read data from your PC
# 
# dbWriteTable(con, "airlines", airlines)                  # Write data to your database
# dbWriteTable(con, "airports", airports)                  # Write data to your database
# dbWriteTable(con, "flights", flights)                    # Write data to your database

airlines <- tbl(con, "airlines")                           # read data from your database
airports <- tbl(con, "airports")                           # read data from your database
flights  <- tbl(con, "flights")                            # read data from your database

dbDisconnect(con)                                          # Disconnect from your database

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

