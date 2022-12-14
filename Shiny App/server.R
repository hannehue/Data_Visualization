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
  
  output$circlePacking <- renderPlot({
    age = raw_data$age3
    
    #Loading in selected question
    quest = reactive({
      single_Column_Quest[,input$singleColumn1]
    })
    
    xlist = list(age, quest())
    mascu_df = as.data.frame(xlist)
    colnames(mascu_df) = c("age", "quest")
    
    #Rendering 
    mascu_df %>%
      count(age, quest) %>%
      group_by(age) %>%
      mutate(n = prop.table(n) * 100) %>%
      ggraph(mascu_df, layout = 'circlepack') + 
        geom_node_circle(fill = age) +
        theme_void()
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
  
  output$pieChart <- renderPlot({
    ggplot(dat_sub, aes(x= age3, y=perc, fill=racethn4)) +
      geom_bar(stat="identity", width=1) +
      coord_polar("y", start=0)
  }, height = 900, width = 900)
  
  
  dat_subH1 <- raw_data %>%
    select(age3, q0009) %>%
    group_by(age3, q0009) %>%
    summarise(n = n()) %>%
    group_by(age3) %>%
    mutate(tot = sum(n), perc = n / tot * 100)
  
  output$horisontalPlot_1 <- renderPlot({
    ggplot(dat_subH1, aes(x = age3, y = perc, fill = q0009)) +
      geom_col(width = 0.1) +
      ggtitle("Which of the following categories best describes your employment status?
  ") +
      xlab("Age groups") +
      ylab("Respondee percentage") +
      scale_fill_discrete(name = "") +
      coord_flip()
  })
  
  
  dat_subH2 <- raw_data %>%
    select(racethn4, q0009) %>%
    group_by(racethn4, q0009) %>%
    summarise(n = n()) %>%
    group_by(racethn4) %>%
    mutate(tot = sum(n), perc = n / tot * 100)
  
  output$horisontalPlot_2 <- renderPlot({
    ggplot(dat_subH2, aes(x = racethn4, y = perc, fill = q0009)) +
      geom_col(width = 0.1) +
      ggtitle("Which of the following categories best describes your employment status?") +
      xlab("Race distribution") +
      ylab("Respondee percentage") +
      scale_fill_discrete(name = "") +
      coord_flip()
  })
  
  output$multiColumn <- renderPlot({
    library(tidyverse)
    Test <- read_excel("data_files/Clean_Multi_Column.xlsx")
    
    Test <- Test %>%
      group_by(Question) %>%
      mutate(percentage = Value / sum(Value) * 100)
    
    Test$Selection = as.factor(Test$Selection)
    Test$Selection = factor(Test$Selection, levels = c("Selected", "Not Selected"))
    Test$percentage = round(Test$percentage, 0)
    Test$Question = factor(Test$Question, levels = c("None of the above", "Height", "Appearance of genetalia", "Clothing style", "Hair", "Sexual performance or amount of sex",
                                                     "Mental health", "Ability to provide for family", "Physique", "Your finances", "Physical health",
                                                     "Weight"))
    ggplot(Test, aes(fill = Selection, x = Question, y = percentage)) +
      geom_bar(position = "fill", stat = "identity") +
      coord_flip() + scale_y_reverse() +
      scale_fill_manual(values = c("#E0912A", "#005F94")) +
      labs(title = "What do you worry about on a daily/near daily basis")
  })

})
