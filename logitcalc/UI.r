
library(shiny)


shinyUI(fluidPage(
  
  includeCSS("../bootstrap.css"),
  
  # Application title
  headerPanel("Conversion Test Calculator"),
  
  sidebarPanel(h6("Use this test when the OEC is a conversion rate with user as the denominator.
                   For example, % of users who complete a given action.\n"),
    
               numericInput(inputId = "n1", label="Experiences 1", value = 300, min = 0, step=1),
          
               numericInput(inputId = "x1", label="Conversions 1", value = 30, min = 0, step=1),
        
               numericInput(inputId = "n2", label="Experiences 2", value = 400, min = 0, step=1),
  
               numericInput(inputId = "x2", label="Conversions 2", value = 30, min = 0, step=1),
       
               submitButton("Update View")),
  
  mainPanel(
    h2("Summary"),
            h4("Conversion Rates"),
            verbatimTextOutput("con"),
            h4("Significance"),
            verbatimTextOutput("pval"))
))
