library(shiny)
library(fullPage)

ui <- fullPage(
    menu = c("Init" = "init", "First Market" =  "first_market", "Second Market" = "second_market"),
    fullSection(
        menu = "init",
        fullRow(
            align = "center",
            textInput("address", "address"),
            actionButton("bttn", "bttn")
        )
    ),
    fullSection(
        menu = "first_market"
    ),
    fullSection(
        menu = "second_market"
    )
)

server <- function(input, output) {

    shiny::observeEvent(input$bttn, {
        updateTabsetPanel(session, )
    })
}

shinyApp(ui, server)
