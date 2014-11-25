Developing Data Products Presentation
========================================================
author: Tobias Crabtree
date: November 2014

Shiny Apps Project
========================================================

Simple To Use Shiny App For Stock Market Returns 

- Plot stock market prices over time 
- Plot a distribution of daily returns 
- Quickly see daily, weekly, monthly, yearly returns


Quantmod Package
========================================================
Our shiny app uses the quantmod package. Data is sourced from Yahoo! Finance. Our app allows the user to select from 3 stock market indices: S&P 500, Dow Jones, and Nasdaq.

```r
require(quantmod)
# select ticker from list
selectInput("ticker", "Index", "",
            choices=c("S&P 500"="SPY",
                      "Dow"="DIA",
                      "Nasdaq"="QQQ"
                      ), 
                                    )
# gets the stock price data
getSymbols("SPY", src = "yahoo",
           from=2010-01-01,
           to=2014-10-31,
           auto.assign = FALSE) 
```

See Stock Market Returns Distribution
========================================================

![plot of chunk unnamed-chunk-2](devdatapresentation-figure/unnamed-chunk-2-1.png) 
Try The Shiny App
=======================================================
Try the app at:
https://tobycrabtree.shinyapps.io/developingdataproducts/
