#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import semantic.dashboard
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    # golem_add_external_resources(),
    # List the first level UI elements here 
    # Create dashboard sidebar bars
    dashboard_tabs <- sidebarMenu(
      menuItem(tabName = "map", "Map", 
               icon=semantic.dashboard::icon("map")),
      menuItem(tabName = "article", "Articles", 
               icon=semantic.dashboard::icon("home")),
      menuItem(tabName = "bacteria", "Bacteria", 
               icon=semantic.dashboard::icon("bug")),
      menuItem(tabName = "archaea", "Archaea", 
               icon=semantic.dashboard::icon("bug")),
      menuItem(tabName = "chemistry", "Chemistry", 
               icon=semantic.dashboard::icon("flask")),
      menuItem(tabName = "geology", "Geology", 
               icon=semantic.dashboard::icon("cube")),
      menuItem(tabName = "volcano", "Mud volcano", 
               icon=semantic.dashboard::icon("star")),
      menuItem(tabName = "methods", "Methods", 
               icon=semantic.dashboard::icon("wrench")),
      menuItem(tabName = "abstract", "Abstracts", 
               menuSubItem(tabName="abs_bacteria", "Bacteria"),
               menuSubItem(tabName="abs_archaea", "Archaea"),
               menuSubItem(tabName="abs_chem", "Chemistry"),
               menuSubItem(tabName="abs_volcano", "Mud Volcano")),
      menuItem(tabName = "contact", "Contact",
               icon=semantic.dashboard::icon('at'))))
  
  # Create dashboard header 
  dashboard_head <- dashboardHeader(color = "black",
                                    inverted = TRUE,
                                    tags$button(
                                      class="ui black button", 
                                      "muddy_db - mud volcano database",
                                      style="font-size:20px;"),
                                    tags$a(
                                      class = "ui small black button", 
                                      semantic.dashboard::icon("big github"),
                                      href="https://github.com/TracyRage/muddy_db"))
  
  # Create dashboard sidebar
  dashboard_sidebar <- dashboardSidebar(size="thin",
                                        color="black",
                                        inverted=TRUE,
                                        dashboard_tabs)
  
  # Create dashboard body
  dashboard_body <- dashboardBody(
    tabItems(
      tabItem(tabName = "map", mod_map_ui("map_ui_1")),
      tabItem(tabName = "article", mod_articles_ui("articles_ui_1")),
      tabItem(tabName = "archaea", mod_archaea_ui("archaea_ui_1")),
      tabItem(tabName = "bacteria", mod_bacteria_ui("bacteria_ui_1")),
      tabItem(tabName = "chemistry", mod_chemistry_ui("chemistry_ui_1")),
      tabItem(tabName = "volcano", mod_volcano_ui("volcano_ui_1")),
      tabItem(tabName = "methods",  mod_methods_ui("methods_ui_1")),
      tabItem(tabName = "geology", mod_geology_ui("geology_ui_1")),
      tabItem(tabName = "contact",  mod_contact_ui("contact_ui_1")),
      tabItem(tabName = "abs_archaea", 
              mod_abstract_archaea_ui("abstract_archaea_ui_1")),  
      tabItem(tabName = "abs_bacteria", 
              mod_abstract_bacteria_ui("abstract_bacteria_ui_1")),
      tabItem(tabName = "abs_chem", 
              mod_abstract_chemistry_ui("abstract_chemistry_ui_1")),
      tabItem(tabName = "abs_volcano",  
              mod_abstract_volcano_ui("abstract_volcano_ui_1")))) 
  
  # Create dashboard
  dashboardPage(title = "muddy_db - mud volcano database",
                theme = "slate",
                dashboard_head,
                dashboard_sidebar,
                dashboard_body)
}

#' #' Add external Resources to the Application
#' #' 
#' #' This function is internally used to add external 
#' #' resources inside the Shiny application. 
#' #' 
#' #' @import shiny
#' #' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' #' @noRd
#' golem_add_external_resources <- function(){
#'   
#'   add_resource_path(
#'     'www', app_sys('app/www')
#'   )
#'  
#'   tags$head(
#'     favicon(),
#'     bundle_resources(
#'       path = app_sys('app/www'),
#'       app_title = 'muddy'
#'     )
#'     # Add here other external resources
#'     # for example, you can add shinyalert::useShinyalert() 
#'   )
#' }

