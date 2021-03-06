library(shiny)
library(shinyCopy2clipboard)

# The UI
ui <- fluidPage(

  # Load
  use_copy(),

  # Text Input 1
  textInput("text", "Enter Your Text", "Hello World!"),

  # Copy Button 1
  CopyButton(
    "copybtn",
    "Copy to Clipboard",
    icon = icon("copy"),
    text = "No Text Found",
    class = "btn-primary",
    width = "150px"
  ),

  br(),
  br(),

  # Text Input 2
  textInput("text2", "Enter Your Text"),

  # Copy Button 2
  CopyButton(
    "copybtn2",
    "Copy to Clipboard",
    icon = icon("copy"),
    text = "No Text Found",
    class = "btn-primary"
  ),

  br(),
  br(),

  # Button for Modal
  actionButton('mdl', 'Show Button in Modal')

)

# The server
server <- function(input, output, session) {

  observeEvent(input$mdl, {

    shiny::showModal(
      modalDialog(
        textInput("text3", "Enter your comments"),

        CopyButton(
          "copybtn3",
          "Copy to Clipboard",
          icon = icon("copy"),
          text = "No Text Found",
          class = "btn-primary",
          modal = TRUE
        )

      )
    )

  })

  observe({

    CopyButtonUpdate(session,
                     id = "copybtn",
                     label = "Copy to Clipboard",
                     icon = icon("copy"),
                     text = input$text
    )

  })


  observe({
    req(input$copybtn2)
    CopyButtonUpdate(session,
                     id = "copybtn2",
                     label = "Copy to Clipboard",
                     icon = icon("cut"),
                     text = input$text2
    )

  })

  observe({
    req(input$copybtn3)
    CopyButtonUpdate(session,
                     id = "copybtn3",
                     label = "Copy to Clipboard",
                     icon = icon("copy"),
                     text = input$text3,
                     modal = TRUE
    )
  })



}

shinyApp(ui = ui, server = server)
