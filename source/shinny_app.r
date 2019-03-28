library(dplyr)
library(reshape2)
library(ggplot2)
library(Hmisc)
library(corrplot)
library(mice)
library(VIM)
library(pROC)
library(caret)
library(sqldf)
library(shiny)
library(data.table)


testData = read.csv("./telecomData.csv", header = TRUE, na.strings =  c("NA","","#NA"))
clus1Num = sum(testData$Cluster == 1)
clus2Num = sum(testData$Cluster == 2)
clus3Num = sum(testData$Cluster == 3)
table <- data.table(testData)


ui <- fluidPage(

  #pie-chart of the cluster
  plotOutput("cluster_plot"),

  radioButtons("cluster", "Clusters:", c("Cluster 1"= 1, "Cluster 2" = 2, "Cluster 3" = 3)),
  
  plotOutput("hist_plot")



)

server <- function(input, output) ({
  output$cluster_plot <- renderPlot ({
    pie(c(clus1Num, clus2Num, clus3Num),
        labels = c("cluster 1", "cluster 2", "cluster 3"),
        main = "Cluster distribution of the data-set")
  })
  
  output$hist_plot <- renderPlot({
    index <- input$cluster
    cluster <- table[table$Cluster == index]
    hist(cluster$MonthlyRevenue, main = "Monthly Revnue")
  })
})

shinyApp(ui, server)