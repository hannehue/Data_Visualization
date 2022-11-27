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
  
  dat_sub <- raw_data %>%
    select(age3, racethn4) %>%
    group_by(age3, racethn4) %>%
    summarise(n = n()) %>%
    group_by(age3) %>%
    mutate(tot = sum(n), perc = n / tot * 100)
  
  output$stacked_bar_chart <- renderPlot({
    ggplot(dat_sub, aes(x = age3, y = perc, fill = racethn4)) +
      geom_col(width = 1) +
      ggtitle("Age and race distribution of respondees") +
      xlab("Age groups") +
      ylab("Respondee percentage") +
      scale_fill_discrete(name = "Race")
    
  })

})
