library(shiny)
library(ggplot2)
actors <- read.csv("data/IMDBactors4D.csv", header = TRUE, sep = ";")
shinyServer(function(input, output) {
  dataset <- reactive({
    actors[sample(nrow(actors), input$sampleSize),]
    })
  output$plot <- renderPlot({
    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    facets <- paste(input$facet_row, '~', input$facet_col)
    if (facets != '. ~ .')
      p <- p + facet_grid(facets)
    if (input$smooth)
      p <- p + geom_smooth()
    print(p)
  }, height=700)
})