shinyServer(
  function(input, output, session) {
    
    
    
  
  # Barchart
  age = raw_data$age3
  # mascu = raw_data$q0002
  
  output$mascuPlot <- renderPlot({
    
    quest = reactive({
      single_Column_Quest[,input$questionPicker]
    })
    
    xlist = list(age, quest())
    mascu_df = as.data.frame(xlist)
    
    mascu_df %>%
      count(age, quest = factor(quest())) %>%
      group_by(age) %>%
      mutate(n = prop.table(n) * 100) %>%
      ggplot(aes(age, n, fill = quest)) +
      geom_col(position = "dodge")
  }, height = 600, width = 900)

})
