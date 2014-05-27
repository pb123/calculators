library(shiny)
library(scales)

shinyServer(function(input, output) {
  prop1 <- reactive({
    prop.test(c(input$x1, input$x2), c(input$n1, input$n2), correct=FALSE, conf.level=0.9)
    })


  
  ## calc conversion rates
  output$con <- renderPrint({
    con1 <- prop1()$estimate[[1]]
    con2 <- prop1()$estimate[[2]]
    cat(paste0("Variation 1: ", percent(con1), 
               "  Variation 2: ",  percent(con2)))
    
  })
  
  # calc significance
  output$pval <- renderPrint({
    con1 <- prop1()$estimate[[1]]
    con2 <- prop1()$estimate[[2]]
    pval <- prop1()$p.value
    
    if(input$x2 < 10 | input$x1 < 10){
      return(cat("Not enough conversions"))
    } 
    
    if(input$n2 - input$x2 < 10 | input$n1 - input$x1 < 10){
      return(cat("Not enough failures"))
    }
    
    if(pval < 0.1){
      cat("This result is statistically significant.")
      if(con1 > con2){
        cat("\n\nVariation 1 is the winner.")
      } else{cat("\n\nVariation 2 is the winner.")}
    } else{cat("This result is not statistically significant.")}
    
    
    cat(paste0("\n\nP-value = ", round(pval, 3)))
    
                   
  })

})

