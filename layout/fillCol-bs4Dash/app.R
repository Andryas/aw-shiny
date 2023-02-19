library(shiny)
library(bs4Dash)

ui <- bs4Dash::bs4DashPage(
    bs4Dash::dashboardHeader(),
    bs4Dash::bs4DashSidebar(),
    bs4Dash::bs4DashBody(
        div(
            style = "display: grid; grid-template-columns: 1fr 1fr; grid-template-row: max-content",
            bs4Dash::tabBox(
                title = "something in the way",
                height = "600px",
                width = 12
            ),
            bs4Dash::box(
                title = "something in the way",
                height = "300px",
                width = 12
            ),
            fillCol(
                height = "950px",
                bs4Dash::box(
                    title = "something in the way",
                    height = "400px",
                    width = 12
                ),
                bs4Dash::box(
                    title = "something in the way",
                    height = "400px",
                    width = 12
                ),
                bs4Dash::box(
                    title = "something in the way",
                    height = "500px",
                    width = 12
                )
            )
        )
    )
)

server <- function(input, output, session) {}

shinyApp(ui, server)