#' Button for copying text to clipboard
#'
#' It copies text to clipboard using clipboardjs
#'
#' @param id HTML ID to use for button.
#' @param label Text label of the button.
#' @param text Text to be copied in clipboard.
#' @param icon icon to be shown on the button before label.
#' @param width width of the button.
#' @param class CSS class for customizing button.
#' @param modal Whether button is used within bootstrap modal.
#'
#' @return Button
#' @export
#' @author Deepanshu Bhalla
#'
#' @examples
#' if (interactive()) {
#'  ui <- fluidPage(
#'
#'   # Setup
#'   use_copy(),
#'
#'   # Text Input 1
#'   textInput("text", "Enter Your Text"),
#'
#'   # Copy Button 1
#'   CopyButton(
#'     "copybtn",
#'     "Copy to Clipboard",
#'     icon = icon("copy"),
#'     text = "No Text Found",
#'     class = "btn-primary",
#'     width = "150px"
#'   )
#'
#' )
#
#' server <- function(input, output, session) {
#'
#'   observe({
#'
#'     req(input$copybtn)
#'     CopyButtonUpdate(session,
#'                      id = "copybtn",
#'                      label = "Copy to Clipboard",
#'                      icon = icon("copy"),
#'                      text = input$text
#'     )
#'
#'   })
#'
#' }
#'
#' shinyApp(ui = ui, server = server)
#' }

CopyButton <-
  function(id,
           label,
           text = "No Text",
           icon = NULL,
           width = NULL,
           class = NULL,
           modal = FALSE,
           ...) {

  shiny::actionButton(
    inputId = id,
    label = label,
    icon = icon,
    width = width,
    class = class,
    `data-clipboard-text` = text,
    onclick = if (!modal) {
      paste0('new ClipboardJS(".btn", document.getElementById("',
             id,
             '"));')
    }
    else {
      paste0('new ClipboardJS(".btn", { container: document.getElementById("',
             id,
             '") });')
    }, ...
  )

  }


#' Update text to be copied on the client
#'
#' Update text to be copied in clipboard on the client
#'
#' @param session Session object passed to function given to shinyServer
#' @param id HTML ID to use for button.
#' @param label Text label of the button.
#' @param text Text to be copied in clipboard.
#' @param icon icon to be shown on the button before label.
#' @param modal Whether button is used within bootstrap modal.
#'
#' @return Button
#' @export
#' @author Deepanshu Bhalla
#'
#' @examples
#' if (interactive()) {
#'  ui <- fluidPage(
#'
#'   # Setup
#'   use_copy(),
#'
#'   # Text Input 1
#'   textInput("text", "Enter Your Text"),
#'
#'   # Copy Button 1
#'   CopyButton(
#'     "copybtn",
#'     "Copy to Clipboard",
#'     icon = icon("copy"),
#'     text = "No Text Found",
#'     class = "btn-primary",
#'     width = "150px"
#'   )
#'
#' )
#
#' server <- function(input, output, session) {
#'
#'   observe({
#'
#'     req(input$copybtn)
#'     CopyButtonUpdate(session,
#'                      id = "copybtn",
#'                      label = "Copy to Clipboard",
#'                      icon = icon("copy"),
#'                      text = input$text
#'     )
#'
#'   })
#'
#' }
#'
#' shinyApp(ui = ui, server = server)
#' }

CopyButtonUpdate <- function(session,
                             id = "copybtn",
                             label = "Copy to Clipboard",
                             icon = NULL,
                             text = "Sample Text",
                             modal = FALSE) {
  if (!is.null(icon))
    icon <- as.character(icon)

  session$sendCustomMessage(
    "copybtnUpdate",
    list(
      id = id,
      label = label,
      icon = icon,
      `data-clipboard-text` = text,
      onclick = if (!modal) {
        paste0('new ClipboardJS(".btn", document.getElementById("',
               id,
               '"));')
      }
      else {
        paste0('new ClipboardJS(".btn", { container: document.getElementById("',
               id,
               '") });')
      }
    )
  )

}
