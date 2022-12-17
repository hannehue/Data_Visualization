shinyUI(
  fluidPage(theme = "style.css",
    div(style = "padding: 1px 0px; width: '100%'",
      titlePanel(
                  title = "",
                  windowTitle = "Data Visualization - Masculinity Survey"
                )
            ),
  navbarPage(

  # Application title.
  title = div(span(img(src = "lego_head_small.png"),
                   "Masculinity data visualization",
                   style = "position: relative; top: 50%; transform: translateY(-50%);")),
  
  # Barchart
  tabPanel(
    "Barchart",
    tabsetPanel(
      type = "tabs",
      tabPanel(
        "Overview of questions",
        sidebarPanel(
          selectInput(
            inputId = "singleColumn", label = "Choose a question",
            choices = colnames(single_Column_Quest)
          ),
          tags$p(HTML("<h3>Barchart</h3>")),
          tags$p(HTML("The bar chart shows the distribution of answers to each question in the survey on masculinity taken by adult men. The chart includes separate bars for different age groups (18-34, 35-64, and 65+). The height of each bar corresponds to the number of respondents who answered the survey question and fell into the corresponding age and racial group."))
        ),
        mainPanel(
          plotOutput("mascuPlot") %>%
            withSpinner()
        )
      ),
      tabPanel(
        "Stacked bar chart",
        sidebarPanel(
          tags$p(HTML("<h3>Stacked bar chart</h3>")),
          tags$p(HTML("This stacked bar chart shows the concentration of each ethnicity of all of the respondents. This chart does not necessarily answer formulated questions, it still does provide some insight in the data. There are several reasons why it is important and useful to create a chart showing the different ethnicities of respondents in a survey and the percentage each ethnicity represents. Firstly, such a chart can help to highlight any potential biases or imbalances in the sample population. If certain ethnicities are significantly underrepresented in the survey, it may affect the reliability and generalizability of the results. By creating a chart, it becomes easier to identify any potential issues with the sample and to adjust the analysis accordingly. Finally, a chart like this can be useful for presenting the results of the survey in a clear and concise manner, making it easier for others to understand and interpret the data. By visualizing the data in this way, it becomes easier to see the overall picture and to identify any important trends or patterns. Overall, creating a chart showing the different ethnicities of respondents in a survey and the percentage each ethnicity represents is an important and useful tool for understanding and interpreting the data. We can see on the chart that the white people represent the majority in all age groups, but they have an even stronger representation further up we go in the age groups. This means that our data for races such as black and hispanics become less and less accurate and potentially biased the higher up we look in the age groups of respondents. This is an important factor to consider when analyzing the data."))
        ),
        mainPanel(
          plotOutput("stacked_bar_chart") %>%
            withSpinner()
        )
      )
    )
  ),
  
  tabPanel(
    "Horizontal barplots",
    tabsetPanel(
      type = "tabs",
      tabPanel(
        "Horizontal barplot",
        sidebarPanel(
          tags$p(HTML("<h3>Horizontal barplot</h3>"))
          ),
          mainPanel(plotOutput("horisontalPlot_1") %>%
                    withSpinner()
        )
      ),
      tabPanel(
        "Horizontal barplot v2",
        sidebarPanel(
          tags$p(HTML("<h3>Horizontal barplot</h3>")),
        ),
        mainPanel(plotOutput("horisontalPlot_2") %>%
                    withSpinner()
        )
      )
    )
  ),
  
  # Density chart.
  tabPanel(
    "Multicolumn charts",
    tabsetPanel(
      type = "tabs",
      tabPanel(
        "Mens concerns",
        sidebarPanel(
          tags$p(HTML("<h3>Multicolumn chart</h3>")),
          tags$p(HTML("The stacked bar chart shows what men worry about, about themselves. Men might feel a lot of pressure from the media, people and so on, as to how they should look or act, and this graph helps visualize what men actually worry about. All of these factors are grouped on a single chart to easily give a holistic overview of the ranking of these factors. This showed that the vast majority of men do not care about their height, at least not worry about it, but are actually more worried about their weight.")),
          tags$p(HTML("<h4>Which of the following do you worry about on a daily or near daily basis? (Select all that apply.)</h4>")),
          tags$p(HTML("Your height")),
          tags$p(HTML("Your weight")),
          tags$p(HTML("Your hair or hairline")),
          tags$p(HTML("Your physique")),
          tags$p(HTML("Appearance of your genitalia")),
          tags$p(HTML("Your clothing or style")),
          tags$p(HTML("Sexual performance or amount of sex")),
          tags$p(HTML("Your mental health")),
          tags$p(HTML("Your physical health")),
          tags$p(HTML("Your finances, including your current or future income, assets, or debt")),
          tags$p(HTML("Your ability to provide for your family, current or anticipated")),
          tags$p(HTML("None of the above"))
        ),
          mainPanel(
            plotOutput("multiColumn") %>%
              withSpinner()
          )
      ),
      tabPanel(
        "Animated multicolumn chart",
        sidebarPanel(
          tags$p(HTML("<h3>Multicolumn chart</h3>")),
          tags$p(HTML("The stacked bar chart gave a great overview about what men worry about, but we wondered if there was a noticeable difference between what men worry about based on what race they were. A great way to show this was to animate the graph, cycling through respondents based on their race.This shows that generally, the top three factors stay in the top three, meaning that the major factor all men, across race, worry about are Weight, Physical health, and their finances. It was interesting to see that among Asians, their physical health was much more worrying to them than their weight, where weight was higher, or much closer to being higher, among other races. The animated chart is available in our Shiny App.")),
          tags$p(HTML("<h4>Which of the following do you worry about on a daily or near daily basis? (Select all that apply.)</h4>")),
          tags$p(HTML("Your height")),
          tags$p(HTML("Your weight")),
          tags$p(HTML("Your hair or hairline")),
          tags$p(HTML("Your physique")),
          tags$p(HTML("Appearance of your genitalia")),
          tags$p(HTML("Your clothing or style")),
          tags$p(HTML("Sexual performance or amount of sex")),
          tags$p(HTML("Your mental health")),
          tags$p(HTML("Your physical health")),
          tags$p(HTML("Your finances, including your current or future income, assets, or debt")),
          tags$p(HTML("Your ability to provide for your family, current or anticipated")),
          tags$p(HTML("None of the above"))
        ),
        mainPanel(
          img(
            src ="animation3.gif"
          )
        )
      )
    )
  ),
  
  tabPanel(
    "Numeric Data",
    tabsetPanel(
      type = "tabs",
      tabPanel(
        "Count plot",
        sidebarPanel(
          tags$p(HTML("<h3>Count plot</h3>")),
          tags$p(HTML("After having mapped the ordered categorical to numeric value, we created a count plot that is a scatter plot, where instead of each observation representing a dot, dots were grouped together, and increased the size of that group. This was done, because the range was small, and the majority of dots would be on top of eachother, and it would not explain anything. The count char visualized questions “In general, how masculine or \"manly\" do you feel?” and “How important is it to you that others see you as masculine?”. This shows a distribution of our observations that the majority of them saw themselves as at least somewhat masculine, but the majority of those who did, also felt that it was important that they were perceived as masculine. Our count char also includes brushing, so that you can mouse over a point, to see details about it.")),
        ),
        mainPanel(
          plotlyOutput("countPlot") %>%
            withSpinner()
        )
      ),
      tabPanel(
        "Distribution Plot",
        sidebarPanel(
          tags$p(HTML("<h3>Distribution Plot</h3>")),
          tags$p(HTML("The density plot shows us how important it is to the participants, that they are perceived as masculine, grouped by race. This shows that whites are, the most in the middle, of caring or not caring, where we see in the other races, that the distribution curve is going upward, meaning that generally, it is more important to them, that they are perceived as masculine.")),
        ),
        mainPanel(
          plotOutput("distPlot") %>%
            withSpinner()
        )
      )
    )
  ),
  
  # Later todo
  tabPanel(
    "Research questions",
    # One tab for each plot/table.
    tabsetPanel(
      type = "tabs",
      # Dendrogram of plants.
      tabPanel(
        "Questions",
        # Sidebar panel for controls.
        sidebarPanel(
          tags$p(HTML("<h3>From the data, we have formulated some questions that we want to answer:</h3>")),
          tags$p(HTML("How do questions, such as self-perceived masculinity, come across in different age and race groups?")),
          tags$p(HTML("What are the factors that a man may worry about in relation to his masculinity, and how do these concerns vary across different races?")),
          tags$p(HTML("What is the general spread of races over age that has taken this survey?"))
        )
      )
    )
  ),
  
  # About and credits.
  tabPanel(
    "About",
    tabsetPanel(
      tabPanel(
        "Overview",
        tags$h1("Scope"),
        tags$p(HTML("In this report we use graphs generated from a masculinity survey. It was created by FiveThirtyEight and WNYC. We strive to highlight the correlations between perceived and felt masculinity and how it can impact a man in different ways, across different ages, races, and sexualities.")),
        tags$h1("Contributers"),
        tags$p(HTML("Daniel Bahrami: dabah20@student.sdu.dk")),
        tags$p(HTML("Hans Pedersen: haped20@student.sdu.dk")),
        tags$p(HTML("Jesper Diederichsen: jedie20@student.sdu.dk")),
        tags$p(HTML("Jonas Beltoft: jobel20@student.sdu.dk")),
      ),
      # Credits.
      tabPanel(
        "Credits",
        sidebarPanel(
          tags$h1("Datasets"),
          tags$p(HTML("The data is from <a href=\"https://github.com/fivethirtyeight/data/tree/master/masculinity-survey\"> FiveThirtyEight’s study </a> in collaboration with WNYC, on masculinity and what effects it has on people in different categories. It consists of a series of questions, where the individual can answer typically one of 5 possibilities, usually varying from ‘very much’ to ‘not at all’ and ‘no answer’, with all of them adding up to 100% of people asked. The categories consist of ‘Adult men’, then three age categories of ‘18-34’, ‘35-64’ and ‘65 and up’. After these there are categories for ‘white’ and ‘non-white’, then ‘has children’ and ‘no children’, and lastly sexual orientation summed up as ‘straight’ and ‘gay/bisexual’. "))
        )
      )
    )
  )
  
)))
