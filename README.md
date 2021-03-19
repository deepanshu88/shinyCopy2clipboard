
# shinyCopy2clipboard: Copy Text to Clipboard in shiny apps

<!-- badges: start -->

<!-- badges: end -->

### Introduction

In this package we use [clipboard.js](https://clipboardjs.com/) which is
a lightweight (3kb) javascript library to copy text to clipboard.
Tooltip is also added separately in this package which is outside the
scope of this javascript library. With this package you can fetch the
value from shiny app on the client and send it to clipboard

## Installation

You can install the released version of shinyCopy2clipboard from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("deepanshu88/shinyCopy2clipboard")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
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
    "Copy to Clipboard",
    icon = icon("copy"),
    text = "No Text Found",
    class = "btn-primary",
    width = "150px"
  )

)

# Server
server <- function(input, output, session) {

  observe({

    req(input$copybtn)
    CopyButtonUpdate(session,
                     id = "copybtn",
                     label = "Copy to Clipboard",
                     icon = icon("copy"),
                     text = input$text
    )

  })

}

# Run App
shinyApp(ui = ui, server = server)
```

### Learn More

1. How to show SVG icon instead of text labelled button
2. Detailed Example (including modal)

Go to my blog [listendata.com](https://www.listendata.com/2021/03/shinycopy2clipboard-copy-to-clipboard.html) to read more about the above two points
