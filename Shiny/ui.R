library(shinydashboard)
Outside_choices <- c("Zoning"="MSZoning","Building Type"="BldgType","Linear Feet of Street Connected to Property"="LotFrontage")
Outside_choices_cat <- c("Zoning"="MSZoning","Building Type"="BldgType")
Outside_choices_num <- c("Linear Feet of Street Connected to Property"="LotFrontage")

Inside_choices <- c("Garage Type"="GarageType","Screen Porch Area"="ScreenPorch","Total Rooms Above Grade"="TotRmsAbvGrd","Quality"="OverallQual")
Inside_choices_cat <- c("Garage Type"="GarageType")
Inside_choices_num <- c("Screen Porch Area"="ScreenPorch","Total Rooms Above Grade"="TotRmsAbvGrd","Quality"="OverallQual")

Time_Geo <- c("Year of Built"="YearBuilt","Neighborhood")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("1. Benford's law", tabName = "Benford", icon = icon("th")),
    menuItem("2. Similar Features", icon = icon("th"), tabName = "Similar_Features")
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "Benford",
      fluidRow(
        h2("1. Benford's law"),
        box(
          title = "Plots of Benford's Analysis", status = "primary", solidHeader = TRUE,
          collapsible = TRUE, width=10,
          plotOutput("plot_bfd")
        ),
        box(
          title = "Benford's Test Results", status = "primary", solidHeader = TRUE,
          verbatimTextOutput("bfd_results"),width=10
        )
      )
    ),
    
    tabItem(tabName = "Similar_Features",
            fluidRow(
              h2("2. Similar Features"),
              box(title = "Density Plot of Factors between suspects and non-suspects", width = 8, solidHeader = TRUE, status = "primary",
                   plotOutput("Density_Plot1")
              ),
              box(title = "Inputs", solidHeader = TRUE,width=4,status = "warning",
                  selectInput("Factors", label = h3("Factors (x-axis)"),
                  choices = list("Outside Living Condition" = Outside_choices, "Inside Living Choices" = Inside_choices, "Time & Geography" = Time_Geo), 
                  selected = "Outside_choices")
              )
            ),
              
              fluidRow(
                column(width = 6,
                       tabBox(
                         title = "Categorical Factors",
                         id = "tabset1", height = 500,width=NULL,
                         tabPanel("Violin Plot", plotOutput("Violin_Plot")),
                         tabPanel("Density Plot of Lot Area among Factors", plotOutput("Density_Plot2")),
                         tabPanel("Percent of Suspects", plotOutput("Percent"))
                       ),
                       box(
                         title = "Categorical Inputs", solidHeader = TRUE,width=NULL,status = "warning", height = 400,
                         selectInput("Factors_cat", label = h3("Catgorical Factors (x-axis)"),
                                     choices = list("Outside Living Condition" = Outside_choices_cat, "Inside Living Choices" = Inside_choices_cat, "Time & Geography" = c("Neighborhood"="Neighborhood")))
                       )
                ),
                column(width = 6,
                       tabBox(
                         title = "Numeric Factors",
                         id = "tabset2", height = 500,width=NULL,
                         tabPanel("Correlation", plotOutput("ht")),
                         tabPanel("Scatter Plot of Lot Area", plotOutput("Scatter_Plot")),
                         tabPanel("Percent of Suspects", plotOutput("Per_num"))
                       ),
                       box(
                         title = "Numeric Inputs", solidHeader = TRUE,width=NULL,status = "warning",height = 400,
                         selectInput("Factors_num", label = h3("Numerical Factors (x-axis)"),
                                     choices = list("Outside Living Condition" = Outside_choices_num, "Inside Living Choices" = Inside_choices_num, "Time & Geography" = c("Year of Built"="YearBuilt"))
                       )
                 )
              )
    )
            
            # fluidRow(
            #   h2("2. Similar Features"),
            #   
              # tabBox(
              #   title = "Plots",
              #   id = "tabset1", height = "250px",
              #   tabPanel("Density Plot of Factors", plotOutput("Density_Plot1")),
              #   tabPanel("Violin Plot", plotOutput("Violin_Plot")),
              #   tabPanel("Density Plot of Lot Area", plotOutput("Density_Plot2")),
              #   tabPanel("Percent of Suspects", plotOutput("Percent")),
              #   width=8
              # ),
              # 
              # box(
              #   title = "Inputs", solidHeader = TRUE,
              #   selectInput("Factors", label = h3("Factors (x-axis)"),
              #               choices = list("Outside Living Condition" = Outside_choices, "Inside Living Choices" = Inside_choices, "Time" = Time_choices, "Geography" = Geo_choices), 
              #               selected = "Outside_choices"),
              #   selectInput("Grouping", label = h3("Grouping Factor"),
              #               choices = list("Outside Living Condition" = Outside_choices, "Inside Living Choices" = Inside_choices, "Time" = Time_choices, "Geography" = Geo_choices), 
              #               selected = "Outside_choices"),
              #   width = 4
              # )
            # )
  )
)
)

# Put them together into a dashboardPage
dashboardPage(
  dashboardHeader(title = "Analysis"),
  sidebar,
  body
)
