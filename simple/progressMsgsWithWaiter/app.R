library(shiny)
library(waiter)

ui <- fluidPage(
    useWaiter(),
    actionButton("show", "Show loading with updates")
)

server <- function(input, output, session) {
    # create the waiter
    w <- Waiter$new(html = span("Initialising"))

    msgs <- c("Loading data", "Running model", "Drawing plots")

    observeEvent(input$show, {
        w$show()

        Sys.sleep(2)

        for (i in 1:3) {
            w$update(html = msgs[i])
            Sys.sleep(2)
        }

        w$hide()
    })
}

shinyApp(ui, server)