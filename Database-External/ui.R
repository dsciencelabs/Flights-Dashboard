# Flight-Dashboard using Shiny. 
# Written by : Bakti Siregar, M.Sc
# Department of Business statistics, Matana University (Tangerang)
# Notes: Please don't share this code anywhere (It's just for you)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

source("global.R", local = TRUE)

ui <- dashboardPage(title = "www.baktisiregar.com",
        
        dashboardHeader(title = "Flights Dashboard",titleWidth = 200),
        
        dashboardSidebar(
          selectInput(
          inputId = "airline",
          label = "Airline:",
          choices = airline_list,
          selected = "DL",
          selectize = FALSE),
        sidebarMenu(selectInput(
          inputId = "month",
          label = "Month:",
          choices = month_list,
          selected = 99,
          size = 13,
          selectize = FALSE),
        actionLink("remove", "Remove detail tabs")),
        menuItem("About Me", icon = icon("linkedin"), href = "https://www.linkedin.com/in/bakti-siregar-15955480/"),
        menuItem("Source Code", icon = icon("github"), href = "https://github.com/Bakti-Siregar/Flights-Dashboard"),
        menuItem("Video", icon = icon("youtube"), href = "https://www.youtube.com/watch?v=vZR_2hhvsu4")
        
        ),
        
        dashboardBody(gitlink::ribbon_css("https://github.com/Bakti-Siregar/Flights-Dashboard", 
                          position = "right", 
                          parent_css = list("z-index" = "1040", "pointer-events" = "none"),
                          "pointer-events" = "auto"
                        ),
        tabsetPanel(id = "tabs",
          tabPanel(title = "Main Dashboard",
                   value = "page1",
                  fluidRow(valueBoxOutput("total_flights"),
                           valueBoxOutput("per_day"),
                           valueBoxOutput("percent_delayed")),
                  fluidRow(column(width = 6,d3Output("group_totals")),
                           column(width = 6,d3Output("top_airports"))
                            )
                          )
                        )
                      )
                    )
