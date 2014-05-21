
library(shiny)


# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Conversion Test Calculator"),
  sidebarPanel(numericInput(inputId = "n1", label="Experiences 1", value = 0, min = 0, step=1),
          
               numericInput(inputId = "x1", label="Conversions 1", value = 0, min = 0, step=1),
        
               numericInput(inputId = "n2", label="Experiences 2", value = 0, min = 0, step=1),
  
               numericInput(inputId = "x2", label="Conversions 2", value = 0, min = 0, step=1),
       
               submitButton("Update View")),
  mainPanel(h4("Summary"),
            verbatimTextOutput("summary"))
))