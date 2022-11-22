shinyServer(
  function(input, output, session) {
    
  age = raw_data$age3
  mascu = raw_data$q0002
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
  
  #Masculinity_Data = read_csv("masculinity-survey.csv")
  #raw_data = read_csv("raw-responses.csv")

  


})
