shinyServer(
  function(input, output, session) {
    
    #     barchart = reactive({
    #       selected.quiestion = input$quiestion_picker
    #       age = raw_data$age3
    #       mascu = raw_data$selected.quiestion
    #       xlist = list(age, mascu)
    #       mascu_df = as.data.frame(xlist)
    #       
    #       mascu_df %>%
    #         count(age, mascu = factor(mascu)) %>%
    #         group_by(age) %>%
    #         mutate(n = prop.table(n) * 100) %>%
    #         ggplot(aes(age, n, fill = mascu)) +
    #         geom_col(position = "dodge")
    #     }, height = 600, width = 900)
    #   })
    # 
    # output$mascuPlot <- renderPlot({
    #   barchart
    # })
    
    observe({
      print(input$quiestion_picker)
      # Barchart
      quistion = input$quiestion_picker
      age = raw_data$age3
      mascu = raw_data$q0001
      names(raw_data) <- c(quistion)
      # mascu = raw_data$names
      print(typeof(raw_data))
      xlist = list(age, mascu)
      mascu_df = as.data.frame(xlist)
      
      output$mascuPlot <- renderPlot({
        mascu_df %>%
          count(age, mascu = factor(mascu)) %>%
          group_by(age) %>%
          mutate(n = prop.table(n) * 100) %>%
          ggplot(aes(age, n, fill = mascu)) +
          geom_col(position = "dodge")
      }, height = 600, width = 900)
      
    })
    
    
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
