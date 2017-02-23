library(shiny)
  ui = fluidPage(
    fluidRow(column(width = 12,h2("Uber Test - Tool"))),
    fluidRow(selectInput("date", "Date:",
                c("All"= "all",
                  "1st September 14 " = "2014-09-01",
                  "2nd September 14" = "2014-09-02",
                  "3rd September 14" = "2014-09-03",
                  "4th September 14" = "2014-09-04",
                  "5th September 14" = "2014-09-05",
                  "6th September 14" = "2014-09-06",
                  "7th September 14" = "2014-09-07",
                  "8th September 14" = "2014-09-08",
                  "9th September 14" = "2014-09-09",
                  "10th September 14" = "2014-09-10",
                  "11th September 14" = "2014-09-11",
                  "12th September 14" = "2014-09-12",
                  "13th September 14" = "2014-09-13",
                  "14th September 14" = "2014-09-14"
                  )),tableOutput("data"))
  #### PlotOutput("graph") ###
  )
  server = function(input, output) {
    #### Read the csv file in ### 
    df <- read.csv("./final.csv", header = TRUE, stringsAsFactors = FALSE)
    df <- df[,-1]
    df2 <- df[order(-df[,3]),]
    
    output$data <- renderTable({
    if (input$date %in% "all") {
    df2  
    }else {
    top3 <- head(df2[df2$datetime == input$date,],3)
    btm3 <- tail(df2[df2$datetime == input$date,],3)
    topbtm <- rbind(top3,btm3)
    topbtm
    }
    }, rownames = TRUE)
}
  shinyApp(ui = ui, server = server)