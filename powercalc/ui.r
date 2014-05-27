
library(shiny)


shinyUI(fluidPage(
  
  includeCSS("../bootstrap.css"),
  
  # Application title
  headerPanel("Power Calculator for Conversion Tests"),
  
  sidebarPanel(h6("Use this test when the OEC is a conversion rate with user as the denominator.
                   For example, % of users who complete a given action.\n"),
               
               numericInput(inputId = "n", label="Total Experiences per Day each variation will see", 
                            value = 6000, min = 0, step=1),
#                verbatimTextOutput("")
               numericInput(inputId = "con1", label="Control Conversion Rate", value = 0.03, min = 0, step=0.001),
               
               numericInput(inputId = "con2", label="Predicted Variation Conversion Rate", 
                            value = 0.033, min = 0, step=0.001),
               
               numericInput(inputId = "sl", label="Significance Level", 
                            value = 0.90, min = 0.05, max=0.95, step=0.05),
               
               numericInput(inputId = "power", label="Power", 
                            value = 0.80, min = 0.05, max=0.95, step=0.05),
               
               submitButton("Update View")),
  
  mainPanel(
    h2("Summary"),
    h4("Result"),
    verbatimTextOutput("result"))
))
