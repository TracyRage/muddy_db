#' methods UI Function
#'
#' @description Methods mined data from articles.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_methods_ui <- function(id){
  ns <- NS(id)
  
  # Create header
  header <- render_header(
    "wrench",
    "Methods mined data",
    "Incidence of methods terminology in mined articles"
  )
  
  # Create table
  methods_table <- fluidRow(
    semantic.dashboard::column(16, DT::dataTableOutput(ns("methods"))))
  
  tagList(header, methods_table)
}
    
#' methods Server Function
#'
#' @noRd 
mod_methods_server <- function(input, output, session){
  ns <- session$ns
  
  # Load table
  methods_tbl <- reactive(readr::read_csv(app_sys('article/methods.csv'))) 
  
  # Render table
  output$methods <- DT::renderDataTable(
    methods_tbl(), options = list(pageLength = 10))
 
}
    
## To be copied in the UI
# mod_methods_ui("methods_ui_1")
    
## To be copied in the server
# callModule(mod_methods_server, "methods_ui_1")
 
