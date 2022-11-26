shinyServer(
  function(input, output, session) {
    
    
    
  
  # Barchart
  age = raw_data$age3
  mascu = raw_data$q0002
  xlist = list(age, mascu)
  mascu_df = as.data.frame(xlist)
  #quest = formatted_data[,input$questionPicker]
  
  output$mascuPlot <- renderPlot({
    mascu_df %>%
      count(age, mascu = factor(mascu)) %>%
      group_by(age) %>%
      mutate(n = prop.table(n) * 100) %>%
      ggplot(aes(age, n, fill = mascu)) +
      geom_col(position = "dodge")
  }, height = 600, width = 900)

})
