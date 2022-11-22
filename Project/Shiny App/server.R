shinyServer(
  function(input, output, session) {
    
  age = raw_data$age3
  mascu = raw_data$q0001
  xlist = list(age, mascu)
  mascu_df = as.data.frame(xlist)


  output$mascuPlot <- renderPlot({
    
    ggplot(data = mascu_df, aes(x = age, y = percent , fill=mascu)) +
      geom_bar(aes(y = (..count..)/sum(..count..)), position = position_dodge())
  }, height = 600, width = 600)
  
  #Masculinity_Data = read_csv("masculinity-survey.csv")
  #raw_data = read_csv("raw-responses.csv")

  


})
