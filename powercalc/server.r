library(shiny)

shinyServer(function(input, output) {
  power1 <- reactive({
    power.prop.test(n=NULL, p1=input$con1, p2=input$con2, sig.level=input$sl, power=input$power)

  })

  
  ## result
  output$result <- renderPrint({
  
      cat(paste0("You must expect to run this experiment for ", round(power1()$n/input$n, 2), " days!"))
  
  })
  
})

