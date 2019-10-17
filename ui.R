shinyUI(
	dashboardPage(
		dashboardHeader(title = "My NJMLS Dashboard"),
		dashboardSidebar(
        
        sidebarUserPanel("NJMLS Data Analysis",
                         img(src='NJMLS-logo.png')),
        sidebarMenu(
            menuItem("Map", tabName = "map", icon = icon("map")),
            menuItem("Data", tabName = "data", icon = icon("database")),
            menuItem("Summary Analysis By City", tabName = "Summary", icon = icon("chart-line")),
            menuItem("City Comparision", tabName = "comparision", icon = icon("balance-scale")),
            actionButton("update", "Search")
        )
    ),
    dashboardBody(
      tabItems(
        tabItem(tabName = "map",
                # gvisGeoChart
                fluidRow(box(leafletOutput("map", width = "100%", height = "600px"), width=12))), 
          tabItem(tabName = "data", 
                  fluidRow(
                    box(
                      div(style = 'overflow: scroll',DT::dataTableOutput("table")), width=12
                      )
                    )
                  ),
        tabItem(tabName = 'Summary',
                column(6, uiOutput("county")),
      
                column(6, uiOutput("town"))
        )
        )
      )
	)
)