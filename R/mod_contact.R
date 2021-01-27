#' contact UI Function
#'
#' @description Contact card
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom shiny.semantic card
mod_contact_ui <- function(id){
  ns <- NS(id)
  
  # Create header
  header <- fluidRow(semantic.dashboard::column(16, h2(class = "ui header", 
                        semantic.dashboard::icon("at"),
                        div(class = "content", "Contact me", 
                            style = "font-size:20px;"),
                        style = "color:black;")))
  
  # Create contact card
  card_id <- fluidRow(semantic.dashboard::column(16, card(div(
    class = "content",
    div(class = "header","Remizovschi Alexei"),
    div(class = "meta", "Babeș-Bolyai University, Cluj-Napoca, RO"),
    div(class = "meta", "alexei.remizovschi@protonmail.ch"),
    div(class = "meta", "orcid.org/0000-0003-4273-6051")))))
  
  tagList(header, card_id)
}
    
#' contact Server Function
#'
#' @noRd 
mod_contact_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_contact_ui("contact_ui_1")
    
## To be copied in the server
# callModule(mod_contact_server, "contact_ui_1")
 
