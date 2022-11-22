library(shiny)
library(tidyverse)

#####Import Data

#type in your data path
dat<-read_csv("./DataExerciseShinyApps.csv")
dat<- dat %>% select(c("pid7","ideo5"))

#remove missing values 
dat<-drop_na(dat)

ui <- fluidPage(
  titlePanel("some app"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "number of bins;",
                  min = 1,
                  max = 5, 
                  value = 3)
      ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    print("test")
    print(faithful[, 2])
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = 'darkgray', border = 'white',
         xlab = 'Waiting time to next eruption (in mins)',
         main = 'Histogram of waiting times')
  })
}

shinyApp(ui,server)