shinyServer(function(input, output, session) {
    observeEvent(input$birthday, {
        startAnim(session, 'happy', 'shakeX')
    })
})