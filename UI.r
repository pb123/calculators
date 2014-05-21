
library(shiny)


# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Miles Per Gallon"),
  sidebarPanel(),
  mainPanel( numericInput("visits", "Experiences per Day:", 6000, 0),
             verbatimTextOutput("visits")
             )
))