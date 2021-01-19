#' bacteria UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_bacteria_ui <- function(id){
  ns <- NS(id)
  
  # Create header
  header <- fluidRow(
    semantic.dashboard::column(
      6, h2(
        class = "ui header", 
        semantic.dashboard::icon("bug"),
        div(class = "content", "Bacterial mined data",
            div(
              class = "subheader", 
              "Incidence of bacterial taxonomy in mined articles",
              style = "font-size:20px;")),
        style = "color:black;")))
  
  # Create table
  table <- fluidRow(
    semantic.dashboard::column(16, DT::dataTableOutput(ns("tbl_b"))))
    
  tagList(header, table)
}
    
#' bacteria Server Function
#'
#' @noRd 
#' @import semantic.dashboard
mod_bacteria_server <- function(input, output, session){
  ns <- session$ns
  
  # Load table
  bacteria_table <- reactive({
    readr::read_csv(app_sys('article/bacteria.csv'))})
  
  # Render table
  output$tbl_b <- DT::renderDataTable(bacteria_table(),
                                      options=list(pageLength=7))
 
}
    
## To be copied in the UI
# mod_bacteria_ui("bacteria_ui_1")
    
## To be copied in the server
# callModule(mod_bacteria_server, "bacteria_ui_1")
 
