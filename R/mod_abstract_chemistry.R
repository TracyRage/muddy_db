#' abstract_chemistry UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_abstract_chemistry_ui <- function(id){
  ns <- NS(id)
  # Create header
  header <- render_header(
    "flask", "Chemical mined data",
    "Incidence of hydrocarbon & ion nomenclature in mined abstracts")
  
  # Create hydrocarbon separator
  separator_hydrocarbon <- render_separator("Hydrocarbons")
  
  #  Create inorganic separator
  separator_inorganic <- render_separator("Inoraganic ions")
  
  # Create hydrocarbon table
  table_hydrocarbon <- fluidRow(
    semantic.dashboard::column(
      16, DT::dataTableOutput(ns("tbl_1_abs"))
    )
  )
  
  # Create inorganic table
  table_inorganic <- fluidRow(
    semantic.dashboard::column(
      16, DT::dataTableOutput(ns("tbl_2_abs"))
    )
  )
  
  
  tagList(header, separator_hydrocarbon, table_hydrocarbon,
          separator_inorganic, table_inorganic)
}
    
#' abstract_chemistry Server Function
#'
#' @noRd 
mod_abstract_chemistry_server <- function(input, output, session){
  ns <- session$ns
  
  # Load chemistry table
  chemistry_table_abs <- reactive({
    readr::read_csv(app_sys("abstract/chemistry.csv"))})
  
  # Hydrocarbon table
  output$tbl_1_abs <- DT::renderDataTable(chemistry_table_abs() %>% 
                                        select(pmid, title, ammonium:pahs),
                                      options = list(pageLength = 5))
  
  # Inorganic table
  output$tbl_2_abs <- DT::renderDataTable(chemistry_table_abs() %>% 
                                        select(pmid:phosphate),
                                      options = list(pageLength = 5))
 
}
    
## To be copied in the UI
# mod_abstract_chemistry_ui("abstract_chemistry_ui_1")
    
## To be copied in the server
# callModule(mod_abstract_chemistry_server, "abstract_chemistry_ui_1")
 
