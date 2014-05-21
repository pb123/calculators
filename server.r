library(shiny)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  output$visits <- renderPrint({
    visits <- input$visits
    cat(visits)
  })
})