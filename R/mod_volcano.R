#' volcano UI Function
#'
#' @description Mud volcano mined terminology from articles.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import semantic.dashboard
mod_volcano_ui <- function(id){
  ns <- NS(id)
  
  # Create header
  header <- render_header(
    "star", 
    "Mud volcano mined data",
    "Incidence of mud volcano terminology in mined articles")
  
  # Create table
  volcano_table <- fluidRow(semantic.dashboard::column(
    16, DT::dataTableOutput(ns("volcano"))))
  
  tagList(header, volcano_table)
}
    
#' volcano Server Function
#'
#' @noRd 
mod_volcano_server <- function(input, output, session){
  ns <- session$ns
  
  # Load table
  volcano_tbl <- reactive({
    readr::read_csv(app_sys("article/volcano.csv"))})
  
  # Render table
  output$volcano <- DT::renderDataTable(volcano_tbl(),  
                                   options = list(pageLength = 10))
 
}
    
## To be copied in the UI
# mod_volcano_ui("volcano_ui_1")
    
## To be copied in the server
# callModule(mod_volcano_server, "volcano_ui_1")
 
