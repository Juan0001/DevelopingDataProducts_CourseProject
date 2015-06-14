## import library
library(ggplot2)

## read the data
InjuryMap <- read.csv("./data/Injuries.csv")
FatalityMap <- read.csv("./data/Fatilities.csv")
CropDamMap <- read.csv("./data/CropDamages.csv")
PropDamMap <- read.csv("./data/PropertyDamages.csv")

shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      
      data <- switch(input$var, 
                     "Injures" = InjuryMap,
                     "Fatalities" = FatalityMap,
                     "Crop Damages" = CropDamMap,
                     "Property Damages" = PropDamMap)
      
      color <- switch(input$var, 
                      "Injures" = "red",
                      "Fatalities" = "blue",
                      "Crop Damages" = "green",
                      "Property Damages" = "orange")

      
      ggplot(data, aes(x = long, y = lat, group = group, fill = Total)) + 
        geom_polygon(color = "black") + 
        scale_fill_gradient(low = "white", high = color, guide = "legend")
      
    })
  }
)