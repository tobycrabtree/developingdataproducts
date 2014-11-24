require(shiny); require(quantmod); require(rCharts)

shinyUI(fluidPage(
        titlePanel("Stock Price Returns"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Select Stock Market Index to see a time series plot,
                                 a histogram of daily return data, and all return data. 
                                 Data is from Yahoo Finance."),
                        
                        # Select data series
                        selectInput("ticker", "Index", "", 
                                    choices=c(                                                                                      
                                            "S&P 500"="SPY",
                                            "Dow"="DIA",
                                            "Nasdaq"="QQQ"
                                            ), 
                                    ),
                                             
                        dateRangeInput("dates", 
                                       "Date range:",                                 
                                       start= as.character(Sys.Date()-365),
                                       end = as.character(Sys.Date()))
                     
                ),
                
                mainPanel(tabsetPanel(type = "tabs", 
                                      tabPanel("Plot", plotOutput("plot")), 
                                      tabPanel("Histogram of Daily Returns",plotOutput("plot2")),
                                      tabPanel("Returns Data", tableOutput("table"))
                )
                )
        )))