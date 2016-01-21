
palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    mydata[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    plot(selectedData(), col = clusters()$cluster, pch = 20, cex = 1)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
 
    
   
  
  output$text1 <- renderText({ 
  
    inFile <- input$file
    data<-read.csv(inFile$datapath)
    salary.lm = lm(SALARY ~ CGPA, data=data)
    coeffs = coefficients(salary.lm); coeffs
    CGPA = input$cgpal
    salary = coeffs[1] + coeffs[2]*CGPA
    salary<- round(salary,digits=2)
    paste("Predicted salary is : Rs.", salary)
    tier<-"LOW"
    if(salary>4.0)
    {
      tier<-"HIGH TIER"
      company<-"1) Nomura  2) Technip  3) S&P Capital IQ  4) MU Sigma  5) Informatica  6) Tresvista  7) Tavant Tech  8) ZS Associates"
      
    }
    else if(salary>3.2)
    {
      tier<-"MID TIER"
      company<-"1) Infinite computing solutions  2) Infosys  3) Accenture  4) Amdocs  5) L&T Infotech  6) IGate  7) Teradata  8) Zycus"
    }
    else
    {
      tier<"LOW TIER"
      company<-"1) IBM  2) Marcus Evans  3) Ernst And Young  4) Crimson Interactive  5) Capegemini  6) Mindcraft  "
    }
    paste('Predicted salary is : Rs.', salary, 'lakhs',  '  Predicted company tier is : ', tier, "companies are ", company)
  })
  
  
  
  output$text2 <- renderText({ 
    inFile <- input$file2
    datavar<-read.csv(inFile$datapath)
    
    
    stackloss.lm = lm(SALARY ~   CGPA + MOCK + TENTH + TWELFTH , data=datavar)
    newdata = data.frame(CGPA=input$cgpa,  MOCK=input$mock, TENTH=input$tenth, TWELFTH=input$twelfth )
    salary<-predict(stackloss.lm, newdata)
    salary<- round(salary,digits=2)
    
    tier<-"LOW"
    if(salary>3.9)
    {
      tier<-"HIGH TIER"
      company<-"1) Nomura  2) Technip  3) S&P Capital IQ  4) MU Sigma  5) Informatica  6) Tresvista  7) Tavant Tech  8) ZS Associates"
      
    }
    else if(salary>3.2)
    {
      tier<-"MID TIER"
      company<-"1) Infinite computing solutions  2) Infosys  3) Accenture  4) Amdocs  5) L&T Infotech  6) IGate  7) Teradata  8) Zycus"
      
    }
    else
    {
      tier<"LOW TIER"
      company<-"1) IBM  2) Marcus Evans  3) Ernst And Young  4) Crimson Interactive  5) Capegemini  6) Mindcraft  "
      
    }
    paste("Predicted salary is : Rs.", salary, "lakhs", "Predicted company tier is", tier, "companies are ", company)
    
  })
  
  
  output$text3 <- renderText({ 
    inFile <- input$file4
    datavar<-read.csv(inFile$datapath)  
    am.glm = glm(formula=JOB ~ CGPA + MOCK + TWELFTH + TENTH,            data=datavar,           family=binomial)
    newdata = data.frame(CGPA=input$cgpa1, MOCK=input$mock1 , TWELFTH=input$twelfth1 , TENTH=input$tenth1)
    job<-predict(am.glm, newdata, type="response") 
    job<-round(job, digits = 2)
    paste("The probabilty of getting a job is:", job )
    
    
    
    
    
  })
  
  
  
  
  
  
  
  
  output$contents <- renderTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    inFile1 <- input$file1
    read.csv(inFile1$datapath)
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
})