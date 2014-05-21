library(shiny)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
 
  generateRawData <- function(data){
    n1 <- data[1]; x1 <- data[2]; n2 <- data[3]; x2 <- data[4];
    df <- data.frame(signup=c(rep(0,n1-x1),rep(1,x1),rep(0,n2-x2),rep(1,x2)), 
                     test=factor(c(rep(1,n1), rep(2,n2))))
    df
  }
  

  output$summary <- renderPrint({
    data <- c(input$n1,input$x1,input$n2,input$x2)

    
    
    #     n1 <- input$n1
    #     n2 <- input$n2
    #     x1 <- input$x1
    #     x2 <- input$x2
    
  
    df <- generateRawData(data)
    
    logit1 <- (glm(signup ~ test, data = df, family = "binomial"))
    
    
    summary(logit1)
   
  })
  
  
})