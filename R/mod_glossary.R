#' glossary UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_glossary_ui <- function(id){
  ns <- NS(id)
  
  # Create header
  header <- render_header(
    "book",
    "Glossary",
    "Abbreviations of terms used during mining process"
  )
  
  # Create table
  glossary_table <- fluidRow(
    semantic.dashboard::column(16, DT::dataTableOutput(ns("glossary"))))
  
  tagList(header, glossary_table
 
  )
}
    
#' glossary Server Functions
#'
#' @noRd 
mod_glossary_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    # Load table
    glossary_tbl <- reactive(readr::read_csv(app_sys('article/glossary.csv'))) 
    
    # Render table
    output$glossary <- DT::renderDataTable(
      glossary_tbl(), options = list(pageLength = 15))
 
  })
}
    
## To be copied in the UI
# mod_glossary_ui("glossary_ui_1")
    
## To be copied in the server
# mod_glossary_server("glossary_ui_1")
