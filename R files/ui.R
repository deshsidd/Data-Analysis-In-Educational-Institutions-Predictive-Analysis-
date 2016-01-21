
shinyUI(
  navbarPage("",
             
             tabPanel("WELCOME",                      
                      
                      shinyUI(fluidPage(
                        titlePanel("Data Mining in educational institutions"),
                        br(),
                        sidebarLayout(position = "right",
                                      sidebarPanel( img(src = "data.png", height = 380, width = 375)
                                                    
                                      ),
                                      
                                      
                                      mainPanel(
                                        
                                        strong("By:"),
                                        br(),
                                        
                                        strong("Anuj Chopra (B017)"),
                                        br(),
                                        
                                        strong("Siddhant Deshmukh (B020)"),
                                        br(),
                                        
                                        strong("Devansh Goel (B030)"),
                                        br(),
                                        
                                        strong("Sushant Gupta (B033)"),
                                        
                                        br(),
                                        
                                        strong("Under the Guidance of"),
                                        br(),
                                        
                                        strong("Ms. Pallavi Halarnkar")
                                        
                                        
                                        
                                        
                                      )
                        )))),
             
             
             
             tabPanel("CLUSTERING",shinyUI(pageWithSidebar(
               headerPanel('k-means clustering'),
               sidebarPanel(
                 selectInput('xcol', 'select x axis', names(mydata)),
                 selectInput('ycol', 'select y axis', names(mydata),
                             selected=names(mydata)[[2]]),
                 numericInput('clusters', 'Cluster count', 3,
                              min = 1, max = 9),
                 br(),
                 h1("Conclusions:"),
                 br(),
                 p("1.CGPA is not completely related to salary.", style = "font-family: 'times'; font-si16pt")
                
               ),
               mainPanel(
                 plotOutput('plot1')
               )
             ))),
            
             
             
             
             tabPanel("LINEAR REGRESSION",                      
                      
                      shinyUI(fluidPage(
                        titlePanel("Prediction of the approx. salary"),
                        
                        
                        sidebarLayout(position = "right",
                                      sidebarPanel( h1("Predicted Salary") , 
                                                    textOutput("text1"),
                                                    plotOutput("plot")
                                                    
                                      ),
                                      mainPanel(
                                        fileInput("file", label = h3("File input"), accept = c(
                                          'text/csv',
                                          'text/tab-separated-values',
                                          '.csv')),
                                        h5("Instructions for file input"),
                                        helpText("The required header names should be 'CGPA' and 'SALARY' "),
                                        
                                        
                                        sliderInput("cgpal", label = h3("Enter CGPA"),
                                                    min = 2.0, max = 4.0, value = 3.0, step=0.01),
                                        
                                        br(),
                                        h1("Conclusions:"),
                                        br(),
                                        p("1.CGPA is not completely related to salary.", style = "font-family: 'times'; font-si16pt")
                                       
                                      )
                        )))),
             
             
             
             tabPanel("MULTIPLE REGRESSION", 
                         
                      shinyUI(fluidPage(
                        titlePanel("Prediction of the approx. salary"),
                        
                        
                        sidebarLayout(position = "right",
                                      sidebarPanel( h1("Predicted Salary") , 
                                                    textOutput("text2")
                                                    
                                      ),
                                      mainPanel(
                                        fileInput("file2", label = h3("File input"), accept = c(
                                          'text/csv',
                                          'text/tab-separated-values',
                                          '.csv')),
                                        h5("Instructions for file input"),
                                        helpText("The required header names should be 'CGPA', 'SALARY', 'MOCK' , 'TENTH' , 'TWELFTH' "),
  
                                        sliderInput("cgpa", label = h3("Enter CGPA"),
                                                    min = 2.0, max = 4.0, value = 3.0, step=0.01),
                                        sliderInput("tenth", label = h3("Enter tenth"),
                                                    min = 33, max = 99, value = 50, step=0.5),
                                        sliderInput("twelfth", label = h3("Enter twelfth"),
                                                    min = 33, max = 99, value = 50, step=0.5),
                                        
                                        sliderInput("mock", label = h3("Enter average mock test marks"),
                                                    min = 0, max = 100, value = 50, step=0.5),
                                        
                                        br(),
                                        h1("Conclusions:"),
                                        br(),
                                        p("1.CGPA is not completely related to salary.", style = "font-family: 'times'; font-si16pt")
                                       
                                        
                                      )
                        )))),
                      
             tabPanel("LOGISTIC REGRESSION",
               
             shinyUI(fluidPage(
               titlePanel("Probability of Getting a Job ;)"),
               
               
               sidebarLayout(position = "right",
                             sidebarPanel( h1("Verdict") , 
                                           textOutput("text3"),
                                           plotOutput("distplot")
                             ),
                             mainPanel(
                               
                               fileInput("file4", label = h3("File input"), accept = c(
                                 'text/csv',
                                 'text/tab-separated-values',
                                 '.csv')),
                               h5("Instructions for file input"),
                               helpText("The required header names should be 'CGPA', 'SALARY', 'MOCK' , 'TENTH' , 'TWELFTH' "),
                               
                               sliderInput("cgpa1", label = h3("Enter CGPA"),
                                           min = 2.0, max = 4.0, value = 3.0, step=0.01),
                               numericInput("tenth1", 
                                            label = h3("Enter tenth"), 
                                            value = 50),
                               numericInput("twelfth1", 
                                            label = h3("Enter twelfth"), 
                                            value = 50),
                               sliderInput("mock1", label = h3("Enter average mock test marks"),
                                           min = 0, max = 100, value = 25, step=0.5)
                               
                      
             ))))),
             
             tabPanel("DISPLAY TABLE",                      
                      
                      shinyUI(fluidPage(
                        titlePanel("Data Mining in educational institutions"),
                        br(),
                        sidebarLayout(position = "right",
                                      sidebarPanel( 
                                                    
                                      ),
                                      
                                      
                                      mainPanel(
                                        
                                        fileInput("file1", label = h3("File input"), accept = c(
                                          'text/csv',
                                          'text/tab-separated-values',
                                          '.csv')
                                          
                                      ),
                                      tableOutput('contents')
                                      
                                      )
                        ))))
                      
               
             
             
             
             
             
                      
                      
                      
                      

             
             
             
             
             
))