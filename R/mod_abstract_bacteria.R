#' abstract_bacteria UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_abstract_bacteria_ui <- function(id){
  ns <- NS(id)
  
  # Create header
  header <- render_header("bug", "Bacterial mined data",
                          "Incidence of bacterial taxonomy in mined abstracts")
  
  # Create table
  table <- fluidRow(
    semantic.dashboard::column(16, DT::dataTableOutput(ns("tbl_b_abs"))))
  
  tagList(header, table)
}
    
#' abstract_bacteria Server Function
#'
#' @noRd 
mod_abstract_bacteria_server <- function(input, output, session){
  ns <- session$ns
  
  # Load table
  bacteria_table_abs <- reactive({
    readr::read_csv(app_sys('abstract/bacteria.csv'))})
  
  # Render table
  output$tbl_b_abs <- DT::renderDataTable(bacteria_table_abs(),
                                      options=list(pageLength=15))
 
}
    
## To be copied in the UI
# mod_abstract_bacteria_ui("abstract_bacteria_ui_1")
    
## To be copied in the server
# callModule(mod_abstract_bacteria_server, "abstract_bacteria_ui_1")
 
