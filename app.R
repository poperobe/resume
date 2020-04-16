library(shiny)
library(shinythemes)

# UI####
ui<-fluidPage(title = "Ben's Resume"    ,
  theme=shinytheme("paper"),
  titlePanel(uiOutput("contact")),
  sidebarPanel(width=2,
    checkboxGroupInput("info_box", 
                       "Contact Info:", 
                       choices=c("Phone"="224-321-0465",
                                 "E-mail"="poper38@gmail.com",
                                 "Fax"="<font color=\"red\"> Missing Fax Error: Ben is a millennial</font>"),
                       selected = c("224-321-0465","poper38@gmail.com")),
    radioButtons("detail","Level of detail:",choices = c("High"=T,"Low"=F))
  ),
  mainPanel(width=10,
    tabsetPanel(
      tabPanel("Experience",
               uiOutput("experience")),
      tabPanel("Education",
               uiOutput("education")),
      tabPanel("Skills",
               uiOutput("skills")),
      tabPanel("References",
               uiOutput("references"))
    )
  )
)
# SERVER####
server <- function(input, output,session)  {
  # 1. Header####
  output$contact<-reactive({
      info_holder<-paste0("<h4>",input$info_box,"</h4>")
    HTML(paste0(c("<center>","Robert \"Ben\" Pope<br>",info_holder,"</center>")))
  })
  
  # 2. Experience tab####
  output$experience <- renderUI({
    DMA<-"<h4>Senior Data Mining Analyst</h4>
          <h5>American Greetings</h5>
          Primary responsibilities are process improvement, automation, and research. "
    SA<-"<h4>Senior Statistical Analyst</h4>  
         <h5>Papyrus Recycled Greetings</h5>
         Primary responsibilities were client relations, and sales analytics."
    OR<-"<h4>Operations Research Analyst</h4>  
         <h5>American Greetings</h5>
         Primary responsibilities were solving optimization problems and mathematical modeling."
    if(input$detail){
      DMA<-paste0(DMA,"<br><br>Major Accomplishment: Created Shiny WebApps to replace and improved SAS/Excel based reports. 
      This project saved 60 hours of analysts' time per week, greatly improving the Analytics Team's capacity for meaningful analyses. 
      In addition to traditional sales reporting available in the legacy reports, these Apps featured dynamic visualization, 
      such as geographic sales performance, top product images, store layouts, and various charts and graphs.
      <br>Other responsibilities included organizing and leading R and linux training courses for the analytic organization, as well as informal training")
      
      SA<-paste0(SA,"<br><br>Major Accomplishments: <ul><li>Automating and improving legacy processes. 
      This work lead the way to my current role.
                 <li>Created custom models to generate a recommendation for price structure change. That change resulted 
                 in a 15% sales increase versus control
                 <li>Played a pivotal role in standardizing space data. 
                 Space data refers to the metrics indicating how much space our products take up in store. 
                 It is historically difficult for an specialized analyst to use this data source correctly, and near impossible for everyone else.</ul>")
      
      OR<-paste0(OR,"<br><br>Major Accomplishments: <ul><li>Created a stochastic model of the Corporate supply chain. This model is  
used to estimate the impact of a change to shipping or production without physical testing, and determine optimal shipping policies.
                 <li>Created and automated a space allocation model, as part of which I created a custom non-linear solver. 
                 The end product dynamically determines optimal linear footage for each product category for any number of stores.
                 
                 <br><br><br><br>Please note: The results of all major accomplishments mentioned above are still utilized for their primary function, demonstrating the many lasting contributions in my 6 year career ")
    }
      fluidRow(
      column(3, HTML("<h5>2019 to Current</h5>")),
      column(
        9,
        HTML(DMA)
             ),
        column(3, HTML("<h5>2017 to 2019</h5>")),
        column(
          9,
          HTML(SA)
        ),
      column(3, HTML("<h5>2013 to 2017</h5>")),
      column(
        9,
        HTML(OR)
      )
    )
  })
  
  # 3. Education tab ####
  output$education<-renderUI({
    
    Edin<-"<h4>Edinburgh University</h4>
          <h5>Master of Science</h5>
          Operational Research with Computational Optimization "
    Grin<-"<h4>Grinnell College</h4>
          <h5>Bachelor of Arts</h5>
          Mathematics and Statistics "
    if(input$detail){
      Edin<-paste0(Edin,"<br>The standard degree title is Operational Research. \"with Computational Optimization\" indicates the equivilent of a concentration. 
                   In this case, the concentration is in applying OR techniques via computer programming
                   <br> Dissertation in optimizing baseball strategy")
      Grin<-paste0(Grin,"<br>Interpret as one major in Mathematics, not a double major. \"Mathematics and statistics\" is the name of the department
                   <br> 3.62 GPA
                   <br> 2 year captain of Pioneer baseball team")
    }
    fluidRow(
      column(3, HTML("<h5>2012 to 2013</h5>")),
      column(
        9,
        HTML(Edin)
      ),
      column(3, HTML("<h5>2008 to 2012</h5>")),
      column(
        9,
        HTML(Grin)
      )
    )
  })
  
  # 4. Skills tab####
  output$skills<-renderUI({
    
    tech<-"Stochastic and deterministic modeling  
      <br>Linear and non-linear programming  
      <br>Regression
      <br>Simulation  
      <br>Machine Learning  
      <br>Test v. Control methodology  
      <br>Version control"
    lang<-"R (Shiny)  
      <br>Server SQL  
      <br>SAS  
      <br>VBA  
      <br>C++  
      <br>Java  
      <br>HTML  
      <br>Javascript  
      <br>Very little Chinese"

    fluidRow(
      column(3, HTML("<h5>Technical Skills</h5>")),
      column(
        9,
        HTML(tech)
      ),
      column(12,HTML("<br>")),
      column(3, HTML("<h5>Languages</h5>")),
      column(
        9,
        HTML(lang)
      )
    )
  })
  
  # 5. References tab####
  output$references<-renderUI({
    
    
    Dave<-"<h5>Current Manager</h5>"
    LD<-"<h5>Current Manager</h5>"
    Kris<-"<h5>Coworker</h5>"
    if("224-321-0465" %in% input$info_box){
      Dave<-paste(Dave,"Phone: 216-213-4692<br>")
      LD<-paste(LD,"Phone: 216-224-9518<br>")
      Kris<-paste(Kris,"Phone: 330-727-5661<br>")
    }
    if("poper38@gmail.com" %in% input$info_box){
      Dave<-paste(Dave,"E-mail: dvisger@ag.com")
      LD<-paste(LD,"E-mail: Ldagiasis@gmail.com")
      Kris<-paste(Kris,"E-mail: kris.mills@amgreetings.com")
      
    }

    fluidRow(
      
      
      column(3, HTML("<h5>Dave Visger</h5>")),
      column(
        9,
        HTML(Dave)
      ),
      column(3, HTML("<h5>Lauren Dagiasis</h5>")),
      column(
        9,
        HTML(LD)
      ),
      column(3, HTML("<h5>Kris Mills</h5>")),
      column(
        9,
        HTML(Kris)
      )
    )
  })
  
}

shinyApp(ui = ui, server = server)