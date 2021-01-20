#' chemistry UI Function
#'
#' @description Chemistry mined data from articles.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import semantic.dashboard
mod_chemistry_ui <- function(id){
  ns <- NS(id)
  
  # Create header
  header <- render_header("flask", "Chemical mined data",
    "Incidence of hydrocarbon & ion nomenclature in mined articles")
  
  # Create hydrocarbon separator
  separator_hydrocarbon <- render_separator("Hydrocarbons")
  
  #  Create inorganic separator
  separator_inorganic <- render_separator("Inoraganic ions")
 
  # Create hydrocarbon table
  table_hydrocarbon <- fluidRow(
    semantic.dashboard::column(
      16, DT::dataTableOutput(ns("tbl_1"))
    )
  )
  
  # Create inorganic table
  table_inorganic <- fluidRow(
    semantic.dashboard::column(
      16, DT::dataTableOutput(ns("tbl_2"))
    )
  )
  
  
  tagList(header, separator_hydrocarbon, table_hydrocarbon,
          separator_inorganic, table_inorganic)
}
    
#' chemistry Server Function
#'
#' @noRd 
#' @import dplyr
mod_chemistry_server <- function(input, output, session){
  ns <- session$ns
  
  # Load chemistry table
  chemistry_table <- reactive({
    readr::read_csv(app_sys("article/chemistry.csv"))})
  
  # Hydrocarbon table
  output$tbl_1 <- DT::renderDataTable(chemistry_table() %>% 
                                        select(pmid, title, ammonium:pahs),
                                      options = list(pageLength = 5))
  
  # Inorganic table
  output$tbl_2 <- DT::renderDataTable(chemistry_table() %>% 
                                        select(pmid:phosphate),
                                      options = list(pageLength = 5))
  
  
 
}
    
## To be copied in the UI
# mod_chemistry_ui("chemistry_ui_1")
    
## To be copied in the server
# callModule(mod_chemistry_server, "chemistry_ui_1")
 
