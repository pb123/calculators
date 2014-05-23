library(shiny); library(scales)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
 
  generateRawData <- function(data){
    n1 <- data[1]; x1 <- data[2]; n2 <- data[3]; x2 <- data[4];
    df <- data.frame(signup=c(rep(0,n1-x1),rep(1,x1),rep(0,n2-x2),rep(1,x2)), 
                     test=factor(c(rep(1,n1), rep(2,n2))))
    df
  }
  
  logitModel <- reactive({
    data <- c(input$n1,input$x1,input$n2,input$x2)
    
    df <- generateRawData(data)
    logit1 <- (glm(signup ~ test, data = df, family = "binomial"))
    logit1
  })
  
  predictions <- reactive({
    newdata <- data.frame(test=factor(c(1,2)))
    newdata$testp <- predict(logitModel(), newdata=newdata, type='response')
    pred <- predict(logitModel(), newdata=newdata, type='response', se.fit=TRUE)
    newdata$ll <- newdata$testp - 1.96*pred$se.fit
    newdata$ul <- newdata$testp + 1.96*pred$se.fit
    newdata
  })

  ## calc conversion rates
  output$con <- renderPrint({
    
    cat(paste0("Variation 1: ", percent(predictions()$testp[1]), 
               "  Variation 2: ",  percent(predictions()$testp[2])))
    
  })
  
  # calc significance
  output$pval <- renderPrint({
    
    if(input$x2 < 10 | input$x1 < 10){
      return(cat("Not enough conversions"))
    } 
    
    if(input$n2 - input$x2 < 10 | input$n1 - input$x1 < 10){
      return(cat("Not enough failures"))
    }
    
    if(summary(logitModel())$coeff[2,4] < 0.1){
      cat("This results is statistically significant.")
      if(predictions()$testp[1] > predictions()$testp[2]){
        cat("\n\nVariation 1 is the winner.")
      } else{cat("\n\nVariation 2 is the winner.")}
    } else{cat("This result is not statistically significant.")}
    
    
    cat(paste0("\n\nP-value = ", round(summary(logitModel())$coeff[2,4], 3)))
    
    
  })
})
