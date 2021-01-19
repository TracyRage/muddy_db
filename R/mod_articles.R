#' articles UI Function
#'
#' @description General information regarding mined articles.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import semantic.dashboard
mod_articles_ui <- function(id){
  ns <- NS(id)
  
  # Create value boxes
  value_boxes <- fluidRow(
    semantic.dashboard::column(3, valueBoxOutput(ns("titles"))),
    semantic.dashboard::column(4, valueBoxOutput(ns("s2orc_version"))),
    semantic.dashboard::column(3, valueBoxOutput(ns("model"))),
    semantic.dashboard::column(3, valueBoxOutput(ns("tax_db"))),
    semantic.dashboard::column(3, valueBoxOutput(ns("full_article")))
  )
  
  # Create header
  header <- h2(
    class = "ui header", semantic.dashboard::icon("database"),
    div(
      class = "content", "Mud volcano biological database",
      div(
        class = "subheader", 
        "Database general information (mined articles)",
        style = "font-size:20px;")),
    style = "color:black;")
  
  # Create table
  table <- fluidRow(
    semantic.dashboard::column(16, DT::dataTableOutput(ns("table_output"))))

  tagList(value_boxes, header, table)
}
    
#' articles Server Function
#'
#' @noRd 
#' @import semantic.dashboard
mod_articles_server <- function(input, output, session){
  ns <- session$ns
  
  # Load article table
  article_table <- reactive({
    readr::read_csv(app_sys('article/metadata.csv'))
  })
  
  # Metadata table
  output$table_output <- DT::renderDataTable(article_table(),
                                         options = list(pageLength = 10))
  
  # Titles mined box
  output$titles <- renderValueBox({
    valueBox(
      value = 118,
      subtitle = 'Titles mined',
      size = "mini")})
  
  # S2ORC version box
  output$s2orc_version <- renderValueBox({
    valueBox(
      value = "20200705v1",
      subtitle = 'S2ORC version',
      size = "mini")})
  
  # scispaCy box
  output$model <- renderValueBox({
    valueBox(
      subtitle = "scispaCy model",
      value = "en_core_sci_sm",
      size = "mini")
  })
  
  # NCBI taxonomy box
  output$tax_db <- renderValueBox({
    valueBox(
      subtitle = "NCBI taxonomy version",
      value = "11.01.20",
      size = "mini")
  })
  
  # Full articles box
  output$full_article <- renderValueBox({
    valueBox(
      subtitle = "Full articles",
      value = "57",
      size = "mini"
    )
  })
 
}
    
## To be copied in the UI
# mod_articles_ui("articles_ui_1")
    
## To be copied in the server
# callModule(mod_articles_server, "articles_ui_1")
 
