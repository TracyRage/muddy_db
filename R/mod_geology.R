#' geology UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import semantic.dashboard
mod_geology_ui <- function(id){
  ns <- NS(id)
  
  # Create header
  header <- render_header(
    "cube",
    "Geological mined data",
    "Incidence of geological terminology in mined articles"
  )
  
  # Create table
  methods_table <- fluidRow(
    semantic.dashboard::column(16, DT::dataTableOutput(ns("geology"))))
  
  tagList(header, methods_table)
}
    
#' geology Server Function
#'
#' @noRd 
mod_geology_server <- function(input, output, session){
  ns <- session$ns
  
  # Load table
  geology_tbl <- reactive({readr::read_csv(app_sys('article/geology.csv'))}) 
  
  # Render table
  output$geology <- DT::renderDataTable(
    geology_tbl(), options = list(pageLength = 15))
 
}
    
## To be copied in the UI
# mod_geology_ui("geology_ui_1")
    
## To be copied in the server
# callModule(mod_geology_server, "geology_ui_1")
 
