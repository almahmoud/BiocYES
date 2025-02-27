library(BiocYES)
library(shiny)
library(plotly)
library(ggplot2)

  data("woncan", package="BiocYES")
  sites = unique(woncan$`Cancer Sites`)
  ss = strsplit(woncan$msa, ", ")
  woncan$state = sapply(ss, "[", 2)
  
  ui = fluidPage(
   sidebarLayout(
    sidebarPanel(width=2,
     helpText("WONDER CDC Cancer rates"),
     helpText("Add or remove body sites:"),
     selectInput("casite", "body site", choices=sort(sites),
       selected="Brain", multiple=TRUE),
      actionButton("stopBtn", "stop app")),
    mainPanel(
     tabsetPanel(
      tabPanel("bystate",
       plotlyOutput("boxes")
      ),
      tabPanel("histogram",
       plotlyOutput("hist")
      ),
      tabPanel("about",
       helpText("The age-adjusted rates (for years 1999-2018) reported by body site (and sometimes by gender) are derived from the CDC WONDER
system:  https://wonder.cdc.gov/cancer-v2018.HTML")
      )
     )
    )
   )
  )
