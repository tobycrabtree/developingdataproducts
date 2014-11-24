# Developing Data Products Project
# November 2014

require(shiny); require(quantmod); require(rCharts); require(devtools)
 
shinyServer(function(input, output) {

        # data
        data <- reactive({
                           getSymbols(input$ticker, src = "yahoo",
                                      from=input$dates[1],
                                      to=input$dates[2],
                                      auto.assign = FALSE) 
                        })
        
        # plot output
        output$plot <- renderPlot({
                chartSeries(data(),
                            type="line",
                            name=input$ticker,
                            theme=chartTheme("white")
                            )                   
        })
        
        # plot 2 output
        output$plot2 <- renderPlot({
                hist(OpCl(data()),
                          breaks=30,
                          xlab="Daily Return %",
                          main="Histogram of daily returns"
                     )                                   
        })
        
        
        # table output
        output$table <- renderTable({
                dataReturns <- allReturns(data(), type='arithmetic')              
                dataReturns
        })

})