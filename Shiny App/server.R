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
  
  
  output$multiColumn <- renderPlot({
    questions = c(
      "Height",
      "Weight",
      "Hair",
      "Physique",
      "Appearance of genetalia",
      "Clothing style",
      "Sexual performance or amount of sex",
      "Mental health",
      "Physical health",
      "Your finances",
      "Ability to provide for family",
      "None of the above"
    )
    
    
    q0801Count = factor(worry_about$q0008_0001)
    
    ggplot(data = worry_about) +
      geom_bar(aes(x = questions[1], fill = q0008_0001)) +
      geom_bar(aes(x = questions[2], fill = q0008_0002)) +
      geom_bar(aes(x = questions[3], fill = q0008_0003)) +
      geom_bar(aes(x = questions[4], fill = q0008_0004)) + 
      geom_bar(aes(x = questions[5], fill = q0008_0005)) +
      geom_bar(aes(x = questions[6], fill = q0008_0006)) + 
      geom_bar(aes(x = questions[7], fill = q0008_0007)) +
      geom_bar(aes(x = questions[8], fill = q0008_0008)) + 
      geom_bar(aes(x = questions[9], fill = q0008_0009)) +
      geom_bar(aes(x = questions[10], fill = q0008_0010)) + 
      geom_bar(aes(x = questions[11], fill = q0008_0011)) +
      geom_bar(aes(x = questions[12], fill = q0008_0012)) + 
      coord_flip()
  })

})
