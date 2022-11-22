# DV5 
#simple app
install.packages("shiny")
library(shiny)
ui<- fluidPage(
  titlePanel("my first app"),
  textInput(inputId = "text", label = "type here"),
  textOutput(outputId = "print_text")
)

server<-function(input, output) {
  output$print_text = renderText(input$text)
}

shinyApp(ui = ui, server = server)