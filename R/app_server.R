#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  
  # Map server-side
  callModule(mod_map_server, "map_ui_1")
  
  # Articles server-side
  callModule(mod_articles_server, "articles_ui_1")
  
  # Archaea server-side
  callModule(mod_archaea_server, "archaea_ui_1")
  
  # Bacteria server-side
  callModule(mod_bacteria_server, "bacteria_ui_1")
  
  #Chemistry server-side
  callModule(mod_chemistry_server, "chemistry_ui_1")

}
