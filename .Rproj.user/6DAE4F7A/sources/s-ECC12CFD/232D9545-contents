library(shiny)
library(shinyCopy2clipboard)

# UI
ui <- fluidPage(

  # Setup
  use_copy(),

  # Text Input 1
  textInput("text", "Enter Your Text"),

  # Copy Button 1
  CopyButton(
    "copybtn",
    label = "Copy to clipboard",
    icon = icon("copy"),
    text = "No Text Found"
  )

)

# Server
server <- function(input, output, session) {

  observe({

    req(input$copybtn)
    CopyButtonUpdate(session,
                     id = "copybtn",
                     label = "Copy to clipboard",
                     icon = icon("copy"),
                     text = input$text
    )

  })

}

# Run App
shinyApp(ui = ui, server = server)
