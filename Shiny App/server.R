shinyServer(
  function(input, output, session) {

    # Barchart

    #Reactive consumer (renderplot)
    output$mascuPlot <- renderPlot({
      age = raw_data$age3

      #Loading in selected question
      quest = reactive({
        single_Column_Quest[, input$singleColumn]
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
        geom_col(position = "dodge") +
        theme(axis.text = element_text(size = 15),
              axis.title = element_text(size = 15),
              legend.title = element_text(size = 20), #change legend title font size
              legend.text = element_text(size = 15)) +
        ylab("Amount") +
        xlab("Age group")
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
        scale_fill_discrete(name = "Race") +
        theme(axis.text = element_text(size = 15),
              axis.title = element_text(size = 15),
              legend.title = element_text(size = 20), #change legend title font size
              legend.text = element_text(size = 15))
    })


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
        coord_flip() +
        theme(axis.text = element_text(size = 15),
              axis.title = element_text(size = 15),
              legend.title = element_text(size = 20), #change legend title font size
              legend.text = element_text(size = 15))
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
        coord_flip() +
        theme(axis.text = element_text(size = 15),
              axis.title = element_text(size = 15),
              legend.title = element_text(size = 20), #change legend title font size
              legend.text = element_text(size = 15))
    })

    output$multiColumn <- renderPlot({

      Formatted_Multicolum <- Formatted_Multicolum %>%
        group_by(Question) %>%
        mutate(percentage = Value / sum(Value) * 100)

      Formatted_Multicolum$Selection = as.factor(Formatted_Multicolum$Selection)
      Formatted_Multicolum$Selection = factor(Formatted_Multicolum$Selection, levels = c("Not Selected", "Selected"))
      Formatted_Multicolum$percentage = round(Formatted_Multicolum$percentage, 0)
      Formatted_Multicolum$Question = factor(Formatted_Multicolum$Question, levels = c("None of the above", "Height", "Appearance of genetalia", "Clothing style", "Hair", "Sexual performance or amount of sex",
                                                                                       "Mental health", "Ability to provide for family", "Physique", "Your finances", "Physical health",
                                                                                       "Weight"))
      ggplot(Formatted_Multicolum, aes(fill = Selection, x = Question, y = percentage)) +
        geom_bar(position = "fill", stat = "identity") +
        coord_flip() +
        scale_fill_manual(values = c("#005F94", "#E0912A")) +
        labs(title = "What do you worry about on a daily/near daily basis") +
        theme(axis.text = element_text(size = 15),
              axis.title = element_text(size = 15),

              legend.title = element_text(size = 20), #change legend title font size
              legend.text = element_text(size = 15)) +
        xlab("Factor") +
        ylab("Percentage")
    })

    output$countPlot <- renderPlotly({
      t <- ggplot(numeric_values, aes(`How important is it, that others see you as masculine?`,
                                      `How Masculine do you feel?`)) +
        geom_count(color = "#E0912A") +
        scale_size_area(max_size = 15) +
        labs(
          y = "masculinity: 1 = Not masculine, 5 = Very masculine",
          x = "importance: 1 = Not important, 5 = very important") +
        theme(axis.text = element_text(size = 15),
              axis.title = element_text(size = 15),

              legend.title = element_text(size = 20), #change legend title font size
              legend.text = element_text(size = 15)) +
        xlab("Factor") +
        ylab("Percentage")

      ggplotly(t)
    })

    output$distPlot <- renderPlot({
      ggplot(numeric_values, aes(x = `How important is it, that others see you as masculine?`, group = Race, fill = Race,)) +
        geom_density(adjust = 1, alpha = 0.3) +
        facet_wrap(~Race) +
        theme(axis.text = element_text(size = 15),
              axis.title = element_text(size = 15),

              legend.title = element_text(size = 20), #change legend title font size
              legend.text = element_text(size = 15)) +
        ylab("Density")
    })


    output$report <- downloadHandler(

      filename <- function() {
        paste("Report-group-18", "pdf", sep = ".")
      }

      ,

      content <- function(file) {
        file.copy("www/Report.pdf", file)
      }

      ,
      contentType = "pdf")


  })



