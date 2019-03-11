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
#load ther rf model
load("k_clust.rda")


# shiny app template
ui <- fluidPage(
  
)


server <- function(input, output) {
  
}

shinyApp(ui, server)