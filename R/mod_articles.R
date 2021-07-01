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
  header <- render_header("database",
                          "Mud volcano biological database",
                          "Database general information (mined articles)")
  
  # Create table
  table <- fluidRow(
    semantic.dashboard::column(16, DT::dataTableOutput(ns("table_output"))))
  
  # S2ORC copyright
    s2orc_url <- a("S2ORC", href='https://github.com/allenai/s2orc/',
                   style='color:black;')
    authors_url <- a('Lo et al. 2020', 
                     href='https://doi.org/10.18653/v1/2020.acl-main.447',
                     style='color:black;')
    copyright_url <- a('CC BY-NY 2.0', 
                       href='https://creativecommons.org/licenses/by-nc/2.0/',
                       style='color:black;')
  
  copyright <- fluidRow(semantic.dashboard::column(16,
    tagList("Open-access articles were extracted from",
          s2orc_url, "created by", authors_url, ",",
          copyright_url, ", unmodified.", "Versions: S2ORC (20200705v1).",
          "spaCy (2.3.2), ScispaCy (0.3.0), NCBI taxonomy database (20 Nov, 2020)."))
  )

  tagList(value_boxes, header, table, copyright)
}
    
#' articles Server Function
#'
#' @noRd 
#' @import semantic.dashboard
mod_articles_server <- function(input, output, session){
  ns <- session$ns
  
  createLink <- function(val) {
    sprintf('<a href="https://doi.org/%s" target="_blank" class="btn btn-primary"><font color="blue">%s</font></a>',val, val)
  }
  
  # Load article table
  article_table <- reactive({
    readr::read_csv(app_sys('article/metadata.csv')) %>% 
      mutate(doi = createLink(doi))
  })
  
  # Metadata table
  output$table_output <- DT::renderDataTable(article_table(),
                                         options = list(pageLength = 10),
                                         escape=FALSE)
  
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
 
