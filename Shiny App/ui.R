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
          tags$p(HTML("<b>Hover</b> to see the part name.")),
        ),
        mainPanel(
          plotOutput("mascuPlot") %>%
            withSpinner()
        )
      ),
      tabPanel(
        "All questions1",
        sidebarPanel(
          selectInput(
            inputId = "singleColumn1", label = "Single Column",
            choices = colnames(single_Column_Quest)
          ),
        ),
        mainPanel(
          plotOutput("circlePacking") %>%
            withSpinner()
        )
      ),
      
      tabPanel(
        "Answers by Ethnicity",
        sidebarPanel(
          tags$p(HTML("<b>Hover</b> to see the part name.")),
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
          tags$p(span("Daniels stacked bar chart", style = "color:red")),
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
    "Density chart",

    tabsetPanel(
      type = "tabs",
      tabPanel(

        "Some Chart",
        sidebarPanel(
        ),

        # Main panel with plot.
        mainPanel(
          div() %>%
            withSpinner()
        )
      )
    )

  ),
  
  # Later todo
  tabPanel(

    "Later todo",

    # One tab for each plot/table.
    tabsetPanel(

      type = "tabs",

      # Dendrogram of plants.
      tabPanel(

        "Somethingg nice",

        # Sidebar panel for controls.
        sidebarPanel(
          pickerInput(
            "plantsDendrogramThemePicker", "Filter to one or more themes:",
            choices = c(), multiple = T
          ),
          tags$p(span("Large graphs (e.g., of the full dataset) may take a few seconds to render.", style = "color:red")),
        ),

        # Main panel with dendrogram.
        mainPanel(
          uiOutput("plantsDendrogram") %>%
            withSpinner()
        )
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
