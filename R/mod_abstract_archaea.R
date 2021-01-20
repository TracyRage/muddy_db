#' abstract_archaea UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_abstract_archaea_ui <- function(id){
  ns <- NS(id)
  
  # Create header
  header <- render_header("bug", "Archaeal mined data",
                          "Incidence of archaeal taxonomy in mined abstracts")
  
  # Create table
  
  table <- fluidRow(
    semantic.dashboard::column(
      16, DT::dataTableOutput(ns("tbl_a_abs"))
    )
  )
  
  tagList(header, table)
}
    
#' abstract_archaea Server Function
#'
#' @noRd 
mod_abstract_archaea_server <- function(input, output, session){
  ns <- session$ns
  
  # Load table
  archaea_table_abs <- reactive({
    readr::read_csv(app_sys("abstract/archaea.csv"))})
  
  # Render table
  output$tbl_a_abs <- DT::renderDataTable(archaea_table_abs(),
                                      options=list(pageLength=15))
 
}
    
## To be copied in the UI
# mod_abstract_archaea_ui("abstract_archaea_ui_1")
    
## To be copied in the server
# callModule(mod_abstract_archaea_server, "abstract_archaea_ui_1")
 
