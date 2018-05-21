library(shiny)
library(ggplot2)
library(psycho)

# Run rsconnect::deployApp()

shinyServer(function(input, output) {

  # --------------------------------------------------------------------------

  compute.assessement <- reactive({

    result <- assess(patient=input$patient,
                     mean=input$mean,
                     sd=input$sd,
                     n=input$n,
                     color_controls=input$color_controls,
                     color_CI=input$color_CI,
                     color_score=input$color_score,
                     alpha_controls=input$alpha_controls,
                     alpha_CI=input$alpha_CI)
    return(result)

  })


  #---------------------------------------------------------------------------
  output$plot <- renderPlot({

    # Get the current regression data
    result <- compute.assessement()
    plot(result) + theme(aspect.ratio = 2 / (1 + sqrt(5)))

  })

  #-----------------------------------------------------------------------
  output$text <- renderPrint({
    result <- compute.assessement()
    print(result)
  })

  # output$download.plot <- downloadHandler(
  #   filename = function() {paste("dupa", '.png', sep='') },
  #   content = function(file) {
  #     ggsave(filename, plot = plot(compute.assessement()), device = "png")
  #   })

})

