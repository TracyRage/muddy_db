#' Mud volcano map
#' 
#' @description Annotate interactive map with available mud volcano coordinates
#' 
#' @noRd
#' 
#' @import leaflet 
render_map <- function(reviewed_coordinates, unreviewed_coordinates) {
  # Render map
  leaflet() %>% 
    setView(lng=27.2, lat=45, zoom=4.5) %>%
    # Mud volcanoes mentioned in mined lit-re
    addCircleMarkers(data=reviewed_coordinates, lat= ~lat, lng= ~long,
                     color="yellow",
                     fillColor = FALSE,
                     stroke=0.1, 
                     popup = paste0(
                       "<strong>Place: </strong>",
                       reviewed_coordinates$place, "<br>",
                       "<strong>Title: </strong>",
                       reviewed_coordinates$title, "<br>",
                       "<strong>Authors: </strong>",
                       reviewed_coordinates$authors, "<br>",
                       "<strong>Journal: </strong>",
                       reviewed_coordinates$journals, "<br>",
                       "<strong>Year: </strong>",
                       reviewed_coordinates$year, "<br>",
                       "<strong>PMID: </strong>",
                       reviewed_coordinates$pmid, "<br>",
                       "<strong>doi: </strong>",
                       reviewed_coordinates$doi, "<br>")) %>% 
    
    # Widely known mud volcanoes without reference lit-re (no S2ORC reference)
    addCircleMarkers(data=unreviewed_coordinates, lat= ~lat, lng= ~long,
                     color="red",
                     fillColor = FALSE,
                     stroke=0.1,
                     popup = paste0(
                       "<strong>Place: </strong>",
                       unreviewed_coordinates$place, "<br>",
                       "<strong>Data: </strong>",
                       "N/A", "<br>")) %>%
    
    # Add provider map
    addProviderTiles(providers$CartoDB.DarkMatter)}