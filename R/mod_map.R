#' map UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_map_ui <- function(id){
  ns <- NS(id)
  tagList(
    leaflet::leafletOutput(ns("map"), height=910)
  )
}
    
#' map Server Function
#'
#' @noRd 
#' @importFrom readr read_csv
mod_map_server <- function(input, output, session){
  ns <- session$ns
  # Load tables with geographical coordinates
  reviewed_coordinates <- reactive({
    read_csv(app_sys("article/reviewed_coord.csv"))})
  unreviewed_coordinates <- reactive({
    read_csv(app_sys("article/unreviewed_coord.csv"))})
  
  # Design mud volcano map
  output$map <- leaflet::renderLeaflet({
    render_map(reviewed_coordinates(),
               unreviewed_coordinates())})
 
}
    
## To be copied in the UI
# mod_map_ui("map_ui_1")
    
## To be copied in the server
# callModule(mod_map_server, "map_ui_1")
 
