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
    label = HTML('<img src="copy2clipboard-assets/clippy.svg" width="13" alt="Copy to clipboard">'),
    text = "No Text Found"
  )

)

# Server
server <- function(input, output, session) {

  observe({

    req(input$copybtn)
    CopyButtonUpdate(session,
                     id = "copybtn",
                     label = HTML('<img src="copy2clipboard-assets/clippy.svg" width="13" alt="Copy to clipboard">'),
                     text = input$text
    )

  })

}

# Run App
shinyApp(ui = ui, server = server)
