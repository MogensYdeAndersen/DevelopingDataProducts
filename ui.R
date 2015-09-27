library(shiny)
library(ggplot2)
actors <- read.csv("data/IMDBactors4D.csv", header = TRUE, sep = ";")
dataset <- actors
shinyUI(fluidPage(
  titlePanel("Actor Movie Revenue Explorer"),
  sidebarPanel(
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(50, nrow(dataset)), step=1, round=0),
    selectInput('x', 'X', names(dataset), names(dataset)[[3]]),
    selectInput('y', 'Y', names(dataset), names(dataset)[[6]]),
    selectInput('color', 'Color', c('None', names(dataset))),
    checkboxInput('smooth', 'Smooth'),
    selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
    selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
  ),
  mainPanel(
    plotOutput('plot')
  )
))