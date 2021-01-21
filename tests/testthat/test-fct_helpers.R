library(charlatan)

test_that("render_map creates a map", {
  
  # Create dummy coordinates 1
  coord_review <- data.frame(
    pmid = ch_integer(30),
    place = ch_name(30), 
    lat = ch_lat(30), 
    long = ch_lon(30),
    title = ch_name(30),
    authors = ch_name(30),
    year = ch_integer(30),
    journals = ch_name(30),
    doi = ch_doi(30))
  
  # Create dummy coordinates 2
  coord_unreviewed <- data.frame(
    place = ch_name(30),
    lat = ch_lat(30),
    long = ch_lon(30))
  
  expect_visible(render_map(coord_review,
                            coord_unreviewed))
  
})

test_that("render_separator creates separator", {
  
  expect_visible(render_separator('Test string. Test string.'))
})

test_that("render_header creates header", {
  
  expect_visible(render_header("cube", 
                               "Test Header",
                               "Test Subheader"))
})