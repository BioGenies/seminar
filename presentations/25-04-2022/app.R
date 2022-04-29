library(shiny)
library(ggplot2)

dat <- read.csv("dat.csv")
dat[["clicked"]] <- FALSE

ui <- fluidPage(
  titlePanel("Simple Observer"),
  plotOutput("project_plot", height = 600, click = "plot_click"),
  textOutput("clicked_person"),
  verbatimTextOutput("debug")
)

server <- function(input, output) {
  
  selected_person <- reactiveValues(
    person = character()
  )
  
  observeEvent(input[["plot_click"]], {
    selected_person[["person"]] <- nearPoints(df = dat,
                                              coordinfo = input[["plot_click"]], maxpoints = 1)[["Kto"]]
  })
  
  output[["project_plot"]] <- renderPlot({
    
    dat[dat[["Kto"]] == selected_person[["person"]], "clicked"] <- TRUE
    
    ggplot(dat, aes(x = Projekty, y = Lata, color = Skad, size = clicked)) +
      geom_point() +
      theme_bw()
  })
  
  output[["clicked_person"]] <- renderText({
    validate(
      need(selected_person[["person"]], message = "Click someone!")
    )
    
    paste0("That's ", 
           selected_person[["person"]],
           "!")
  })
  
  
  output[["debug"]] <- renderPrint({
    nearPoints(df = dat, coordinfo = input[["plot_click"]], maxpoints = 1)
  })
  
}

shinyApp(ui = ui, server = server)