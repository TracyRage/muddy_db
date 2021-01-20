#' abstract_volcano UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_abstract_volcano_ui <- function(id){
  ns <- NS(id)
  # Create header
  header <- render_header(
    "star", 
    "Mud volcano mined data",
    "Incidence of mud volcano terminology in mined abstracts")
  
  # Create table
  volcano_table <- fluidRow(semantic.dashboard::column(
    16, DT::dataTableOutput(ns("volcano_abs"))))
  
  tagList(header, volcano_table)
}
    
#' abstract_volcano Server Function
#'
#' @noRd 
mod_abstract_volcano_server <- function(input, output, session){
  ns <- session$ns
  
  # Load table
  volcano_tbl_abs <- reactive({
    readr::read_csv(app_sys("abstract/volcano.csv"))})
  
  # Render table
  output$volcano_abs <- DT::renderDataTable(volcano_tbl_abs(),  
                                        options = list(pageLength = 15))
 
}
    
## To be copied in the UI
# mod_abstract_volcano_ui("abstract_volcano_ui_1")
    
## To be copied in the server
# callModule(mod_abstract_volcano_server, "abstract_volcano_ui_1")
 
