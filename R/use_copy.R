#' Loads libraries for this package
#'
#' Set up for the package. Required in UI
#'
#' @return JS Files
#' @export

use_copy <- function() {

  tagList(shiny::singleton(
    shiny::tags$head(
      shiny::tags$script(src = "copy2clipboard-assets/clipboard.min.js"),
      shiny::tags$script(src = "copy2clipboard-assets/copy2clipboard.js")
    )
  ),
  shiny::tags$body(shiny::tags$script(src = "copy2clipboard-assets/tooltip.js")))

}
