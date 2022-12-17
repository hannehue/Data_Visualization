shinyUI(
  fluidPage(theme = "style.css",
                  div(style = "padding: 1px 0px; width: '100%'",
                      titlePanel(
                        title = "",
                        windowTitle = "Masculinity data visualization"
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
          tags$p(HTML("The bar chart shows the distribution of answers to each question in the survey on masculinity taken by adult men. The chart includes separate bars for different age groups (18-34, 35-64, and 65+). The height of each bar corresponds to the number of respondents who answered the survey question and fell into the corresponding age and racial group.")),
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
          tags$p(HTML("<h4>Info here</h4>")),
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
          tags$p(HTML("<h3>Horizontal barplot</h3>")),
          tags$p(HTML("Info here<")),
        ),
          mainPanel(plotOutput("horisontalPlot_1") %>%
                    withSpinner()
        )
      ),
      tabPanel(
        "Horizontal barplot v2",
        sidebarPanel(
          tags$p(HTML("<h3>Horizontal barplot</h3>")),
          tags$p(HTML("Info here")),
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
          tags$p(HTML("Info here")),
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
          tags$p(HTML("None of the above")),
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
          tags$p(HTML("Info here -")),
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
          tags$p(HTML("None of the above")),
        ),
        mainPanel(
          img(
            src ="animation.gif",
            width = "750px",
            height = "600px"
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
          tags$p(HTML("Info here -")),
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
          tags$p(HTML("Info here -")),
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
          tags$p(HTML("What is the general spread of races over age that has taken this survey?")),
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
        sidebarPanel(
          tags$h1("Scope"),
          tags$p(HTML("In this report we use graphs generated from a masculinity survey. It was created by FiveThirtyEight and WNYC. We strive to highlight the correlations between perceived and felt masculinity and how it can impact a man in different ways, across different ages, races, and sexualities.")),
          tags$h1("Contributers"),
          tags$p(HTML("Daniel Bahrami: dabah20@student.sdu.dk")),
          tags$p(HTML("Hans: haped20@student.sdu.dk")),
          tags$p(HTML("Jesper: jedie20@student.sdu.dk")),
          tags$p(HTML("Jonas: jobel20@student.sdu.dk")),
        )
      ),
      # Credits.
      tabPanel(
        "Credits",
        sidebarPanel(
          tags$h1("Datasets"),
          tags$p(HTML("The data is from <a href=\"https://github.com/fivethirtyeight/data/tree/master/masculinity-survey\"> FiveThirtyEight’s study </a> in collaboration with WNYC, on masculinity and what effects it has on people in different categories. It consists of a series of questions, where the individual can answer typically one of 5 possibilities, usually varying from ‘very much’ to ‘not at all’ and ‘no answer’, with all of them adding up to 100% of people asked. The categories consist of ‘Adult men’, then three age categories of ‘18-34’, ‘35-64’ and ‘65 and up’. After these there are categories for ‘white’ and ‘non-white’, then ‘has children’ and ‘no children’, and lastly sexual orientation summed up as ‘straight’ and ‘gay/bisexual’. ")),
        )
      )
    )
  )
  
)))
