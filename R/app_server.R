#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  callModule(mod_map_server, "map_ui_1")
  callModule(mod_articles_server, "articles_ui_1")
  callModule(mod_archaea_server, "archaea_ui_1")
  callModule(mod_bacteria_server, "bacteria_ui_1")

}
