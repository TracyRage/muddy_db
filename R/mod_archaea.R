#' archaea UI Function
#'
#' @description Archaeal mined taxonomy from articles.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import semantic.dashboard
mod_archaea_ui <- function(id){
  ns <- NS(id)
  
  # Create header
  header <- render_header("bug", "Archaeal mined data",
                          "Incidence of archaeal taxonomy in mined articles")
  
  # Create table
  
  table <- fluidRow(
    semantic.dashboard::column(
      16, DT::dataTableOutput(ns("tbl_a"))
    )
  )
  
  tagList(header, table)
}
    
#' archaea Server Function
#'
#' @noRd 
#' @import semantic.dashboard
mod_archaea_server <- function(input, output, session){
  ns <- session$ns
  
  # Load table
  archaea_table <- reactive({
    readr::read_csv(app_sys("article/archaea.csv"))})
  
  # Render table
  output$tbl_a <- DT::renderDataTable(archaea_table(),
                                      options=list(pageLength=15))
 
}
    
## To be copied in the UI
# mod_archaea_ui("archaea_ui_1")
    
## To be copied in the server
# callModule(mod_archaea_server, "archaea_ui_1")
 
