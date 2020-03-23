library(shiny)
library(caret)
library(randomForest)
library(e1071)

shinyServer(function(input, output) {
  modControl <- trainControl(method = "cv", number = 5)
  model <- train(Species ~., data = iris, method = "rf", trControl = modControl)
  
  modelPred <- reactive({
    slInput <- input$slider_sl
    swInput <- input$slider_sw
    plInput <- input$slider_pl
    pwInput <- input$slider_pw
    predict(model, 
            newdata = data.frame(Sepal.Length = slInput, Sepal.Width = swInput,
                                 Petal.Length = plInput, Petal.Width = pwInput), 
            type = "prob")
  })
    
  
  output$modelPred <- renderTable({
  modelPred()
    })
  output$slInput <- renderText(input$slider_sl)
  output$swInput <- renderText(input$slider_sw)
  output$plInput <- renderText(input$slider_pl)
  output$pwInput <- renderText(input$slider_pw)
})

