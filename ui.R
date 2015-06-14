shinyUI(fluidPage(
  titlePanel("Damages caused by Severe Weather"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create total damage maps caused by severe weather  
        from 1950 to 2015 in USA with information from National Oceanic and Atmospheric Administration (NOAA)."),
      
      selectInput("var", 
                  label = "Choose a type of damage to display",
                  choices = c("Injures", "Fatalities",
                              "Crop Damages", "Property Damages"),
                  selected = "Injures"),
      
      br(),
      br(),
      
      h4("Note:"),
      helpText("The data for this application are download from NOAA (http://www.ncdc.noaa.gov/stormevents/details.jsp). Details of the data can be found on the same website too.")
    ),
    
    mainPanel(plotOutput("map"))
  )
))