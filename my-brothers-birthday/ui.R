library(shiny)
library(shinyanimate)
library(shinyWidgets)

shinyUI(
    fluidPage(
        withAnim(),
        tags$head(
            tags$style(
                HTML("
                    body {
                        height: 100vh;
                    }
                    .container-fluid {
                        padding: 0px;
                        margin: 0px;
                    }
                    #back {
                        height: 100vh;
                        width: 100vw;
                        background: url('https://moon.nasa.gov/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBamNFIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0a69af8413fe01c639d3d60468b342c7fa1380dc/WaterOnTheMoonFull.jpg');
                        background-repeat: no-repeat;
                        background-size: cover;
                    }
                    #brou {
                        width: 100vw;
                        height: 100vh;
                        background:url('brou.png');
                        background-repeat: no-repeat;
                        background-size: cover;
                    }
                "
                )
            )
        ),

        div(
            id = "back",
            div(
                id = "happy",
                column(
                    width = 12, align = "center", style = "margin-top: 5%",
                    actionButton('birthday', "Shake your birthday my dear brother!", icon = icon("cake-candles"))
                ),

                column(
                    width = 12, align = "center", style = "margin-top: 5%; position: absolute; bottom: 0",
                    div(
                        style = 'font-size: 125px; color: white',
                        "Happy birthday!"
                    )
                ),
                div(id = "brou")
            )
        )
    )
)