retrieve_field_day_scores <- function(year = 2024, save_dir = "src/csv",
                                      vb = TRUE) {
  
  assertthat::assert_that(dir.exists(save_dir))
  
  fn_stem <- paste0( "field-day-", year, ".csv")
  url <- paste0("https://contests.arrl.org/ContestResults/", year, "/", fn_stem)
  scores <- readr::read_csv(url, show_col_types = FALSE)
  
  fn <- file.path(save_dir, fn_stem)
  if (!is.null(scores)) readr::write_csv(scores, fn)
}