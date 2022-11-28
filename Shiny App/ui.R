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
        "All questions",
        sidebarPanel(
          selectInput(
            inputId = "singleColumn", label = "Single Column",
            choices = colnames(single_Column_Quest)
          ),
        ),
        mainPanel(
          plotOutput("mascuPlot") %>%
            withSpinner()
        )
      ),
      # tabPanel(
      #   "All questions1",
      #   sidebarPanel(
      #     selectInput(
      #       inputId = "singleColumn1", label = "Single Column",
      #       choices = colnames(single_Column_Quest)
      #     ),
      #   ),
      #   mainPanel(
      #     plotOutput("circlePacking") %>%
      #       withSpinner()
      #   )
      # ),
      
      tabPanel(
        "Answers by Ethnicity",
        sidebarPanel(
          tags$p(HTML("What is the general spread of races over age that has taken this survey?")),
        ),
        mainPanel(
          plotOutput("pieChart") %>%
            withSpinner()
        )
      ),
    )
  ),
  
  tabPanel(
    "stacked bar chart",
    tabsetPanel(
      type = "tabs",
      tabPanel(
        "stacked_bar_chart",
        sidebarPanel(
          tags$p(span("Stacked bar chart", style = "color:red")),
        ),
        mainPanel(
          plotOutput("stacked_bar_chart") %>%
            withSpinner()
        )
      ),

      tabPanel(
        "Horizontal barplot 2",
        sidebarPanel(
        ),
        
        # Main panel with plot.
        mainPanel(plotOutput("horisontalPlot_1") %>%
                    withSpinner()
        )
      ),
      
      tabPanel(
        "Horizontal barplot 2",
        sidebarPanel(
        ),
        
        # Main panel with plot.
        mainPanel(plotOutput("horisontalPlot_2") %>%
                    withSpinner()
        )
      )
      
     )
  ),
  
  # Density chart.
  tabPanel(
    "Multicolumn",

    tabsetPanel(
      type = "tabs",
      tabPanel(

        "Mood counts",
        sidebarPanel(
          tags$p(HTML("<h3>Which of the following do you worry about on a daily or near daily basis? (Select all that apply.)</h3>")),
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
        
          # Main panel with plot.
          mainPanel(
            plotOutput("multiColumn") %>%
              withSpinner()
          )
      ),

      # Table for finding sets with pieces with a particular mood.
      tabPanel(

        "Find sets with a specific mood",

        # Sidebar panel for controls.
        sidebarPanel(
          pickerInput(
            "moodsSetThemePicker", "Filter to one or more themes:",
            choices = c(), multiple = T
          ),
          pickerInput(
            "moodsSetGenderPicker", "Filter to one or more genders:",
            choices = c(),
            options = list(`actions-box` = T),
            multiple = T
          ),
          pickerInput(
            "moodsSetMoodPicker", "Filter to one or more moods:",
            choices = c("Happy", "Sad", "Angry", "Afraid"),
            options = list(`actions-box` = T),
            multiple = T
          )
        ),

        # Main panel with table.
        mainPanel(
          dataTableOutput("moodsSets")
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
          tags$p(HTML("<h3>How does mens rating of their masculinity reflect how physically intimate they are with each other, based on their sexuality?</h3>")),
          tags$p(HTML("<h3>What is the general spread of races over age that has taken this survey?</h3>")),
          tags$p(HTML("<h4>How do questions, such as self perceived masculinity, come across in different age and race groups?</h4>")),
          tags$p(HTML("<h4>How does race and/or income affect how masculine men perceive themselves? And does this have a correlation to how often they cry or show physical affection?</h4>")),
          
        ),
      )
    )
  ),
  
  # About and credits.
  tabPanel(
    "About",
    # Various tabs.
    tabsetPanel(
      
      # General info.
      tabPanel(
        "Overview",
        tags$h1("Scope"),
        tags$p(HTML("In this report we use graphs generated from a masculinity survey. It was created by FiveThirtyEight and WNYC. We strive to highlight the correlations between perceived and felt masculinity and how it can impact a man in different ways, across different ages, races, and sexualities.")),
        tags$h1("Contributers"),
        tags$p(HTML("Daniel Bahrami: dabah20@student.sdu.dk")),
        tags$p(HTML("Hans: haped20@student.sdu.dk")),
        tags$p(HTML("Jesper: jedie20@student.sdu.dk")),
        tags$p(HTML("Jonas: jobel20@student.sdu.dk")),
      ),
      # Credits.
      tabPanel(
        "Credits",
        tags$h1("Datasets"),
        tags$p(HTML("The data is from <a href=\"https://github.com/fivethirtyeight/data/tree/master/masculinity-survey\"> FiveThirtyEight’s study </a> in collaboration with WNYC, on masculinity and what effects it has on people in different categories. It consists of a series of questions, where the individual can answer typically one of 5 possibilities, usually varying from ‘very much’ to ‘not at all’ and ‘no answer’, with all of them adding up to 100% of people asked. The categories consist of ‘Adult men’, then three age categories of ‘18-34’, ‘35-64’ and ‘65 and up’. After these there are categories for ‘white’ and ‘non-white’, then ‘has children’ and ‘no children’, and lastly sexual orientation summed up as ‘straight’ and ‘gay/bisexual’. ")),
      ),
    )
  )
  
)))
