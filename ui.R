library(shiny)
library(colourpicker)

shinyUI(pageWithSidebar(

  headerPanel("Patient Assessment App"),

  sidebarPanel(

    div(
      shiny::numericInput("patient",
                          strong("Patient's Score"),
                          value=0),

      br(),
      shiny::numericInput("mean",
                          strong("Control's Mean"),
                          value=0),
      br(),
      shiny::numericInput("sd",
                          strong("Control's SD"),
                          value=1),
      br(),
      shiny::numericInput("n",
                          strong("Control's number"),
                          value=1000),
      br(),
      br(),
      br(),
      br(),
      colourpicker::colourInput("color_controls",
                  strong("Controls"),
                  value="#2196F3"),

      br(),
      colourpicker::colourInput("color_CI",
                                strong("CI"),
                                value="#E91E63"),

      br(),
      colourpicker::colourInput("color_score",
                                strong("Score"),
                                value="black"),
      br(),
      shiny::sliderInput("alpha_controls",
                         strong("Alpha Controls"),
                         min = 0, max = 1,
                         value = 1, step = 0.1),
      br(),
      shiny::sliderInput("alpha_CI",
                         strong("Alpha CI"),
                         min = 0, max = 1,
                         value = 0.8, step = 0.1)
    ),

    div(
      br(),
      br(),
      br(),
      br(),
      img(src = "logo.png", width = "50%", href="https://github.com/neuropsychology/psycho.R")
    )
  ),

  mainPanel(

    div(
      plotOutput("plot")
      # HTML('<center>'),
      # shiny::downloadButton('download.plot'),
      # HTML('</center>')
      ),


    div(
      br(),
      textOutput("text")
      ),

    div(br(),
        hr(),
        h1("Interpretation"),
        p("The p value obtained when this test is used to test significance also simultaneously provides a point estimate of the abnormality of the patient’s score; for example if the one-tailed probability is .013 then we know that the patient’s score is significantly (p < .05) below the control mean and that it is estimated that 1.3% of the control population would obtain a score lower than the patient’s. As for the credible interval interpretation, we could say that there is a 95% probability that the true level of abnormality of the patient’s score lies within the stated limits, or that There is 95% confidence that the percentage of people who have a score lower than the patient’s is between 0.01% and 6.66%.")
    ),

    div(br(),
        hr(),
        h1("Info"),
        p("Evidence-based practice is the cornerstone of clinical neuropsychology. Crawford et al. (2012) remind that empirically based decision algorithms are almost always superior to clinically based decision making while being more reliable, accurate, and cost-effective (Dawes, Faust, & Meehl, 1989; Grove & Lloyd, 2006; Salzinger, 2005). Thus, neuropsychologists must integrate the scientific approach into their everyday clinical practice."),
        p("Until relatively recently the standard way of testing for a difference between a case and controls was to convert the case’s score to a z score using the control sample mean and standard deviation (SD). If z was less than -1.645 (i.e., below 95% of the controls) then it was concluded that the case was significantly lower than controls. However, this method has serious disadvantages (Crawford and Garthwaite, 2012)."),
        p("Many algorithms have been suggested in order to estimate the uncertainty by computing confidence intervals  Crawford and Garthwaite (2012). Crawford and Garthwaite (2007) demonstrate that their Bayesian test is a better approach than other commonly-used alternatives.")
        ),

    div(br(),
        hr(),
        h1("References"),
        HTML("<ul><li>Crawford, J. R., & Garthwaite, P. H. (2007). Comparison of a single case to a control or normative sample in neuropsychology: Development of a Bayesian approach. Cognitive Neuropsychology, 24(4), 343-372.</li><li>Crawford, J. R., Garthwaite, P. H., & Porter, S. (2010). Point and interval estimates of effect sizes for the case-controls design in neuropsychology: rationale, methods, implementations, and proposed reporting standards. Cognitive neuropsychology, 27(3), 245-260.</li></ul>")
    ),

    div(br(),
        hr(),
        h1("Credits"),
        p(a("Dominique Makowski", href="https://dominiquemakowski.github.io/"), "© & the ", a("psycho", href="https://github.com/neuropsychology/psycho.R"), " package")
        )
    )
))
