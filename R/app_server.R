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
  
  # Chemistry server-side
  callModule(mod_chemistry_server, "chemistry_ui_1")
  
  # Mud volcano server-side
  callModule(mod_volcano_server, "volcano_ui_1")
  
  # Methods server-side
  callModule(mod_methods_server, "methods_ui_1")
  
  # Geology server-side
  callModule(mod_geology_server, "geology_ui_1")
  
  # Contact server-side
  callModule(mod_contact_server, "contact_ui_1")
  
  # Glossary server-side
  mod_glossary_server("glossary_ui_1")
             
  # Archaea abstract server-side
  callModule(mod_abstract_archaea_server, "abstract_archaea_ui_1")
  
  # Bacteria abstract server-side
  callModule(mod_abstract_bacteria_server, "abstract_bacteria_ui_1")
  
  # Chemistry abstract server-side
  callModule(mod_abstract_chemistry_server, "abstract_chemistry_ui_1")
  
  # Mud volcano abstract server-side
  callModule(mod_abstract_volcano_server, "abstract_volcano_ui_1")

}
