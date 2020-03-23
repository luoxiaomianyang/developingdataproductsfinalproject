library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel("Predict Species Based on Sepal and Petal Size"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider_sl", "Slide to choose sepal length", 
                  4, 8, value = 4, step = 0.2),
      sliderInput("slider_sw", "Slide to choose sepal width",
                  2, 5, value = 2, step = 0.2),
      sliderInput("slider_pl", "Slide to choose petal length",
                  1, 7, value = 1, step = 0.2),
      sliderInput("slider_pw", "Slide to choose petal width",
                  0.1, 3, value = 0.1, step = 0.1)
      ),
      mainPanel(
        tabPanel(p(icon("table")),
          h3("Predicted species based on input(%): "),
          tableOutput("modelPred")),
          h4("Selected sepal length value: "),
          textOutput("slInput"),
          h4("Selected sepal width value: "),
          textOutput("swInput"),
          h4("Selected petal length value: "),
          textOutput("plInput"),
          h4("Selected petal width value: "),
          textOutput("pwInput")
        
        )
      )
  )
)
 