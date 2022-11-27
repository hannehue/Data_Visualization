shinyServer(
  function(input, output, session) {
    
  # Barchart
    
  #Reactive consumer (renderplot)
  output$mascuPlot <- renderPlot({
    
    
    age = raw_data$age3
    
    #Loading in selected question
    quest = reactive({
      single_Column_Quest[,input$singleColumn]
    })
    
    xlist = list(age, quest())
    mascu_df = as.data.frame(xlist)
    colnames(mascu_df) = c("age", "quest")
    
    #Rendering 
    mascu_df %>%
      count(age, quest) %>%
      group_by(age) %>%
      mutate(n = prop.table(n) * 100) %>%
      ggplot(aes(age, n, fill = quest)) +
      geom_col(position = "dodge")
  }, height = 600, width = 900)

})
