packages <- c(
  "DBI", "RPostgres", "readr", "dplyr", "dbplyr",
  "glue", "here", "yaml", "jsonlite", "lubridate",
  "testthat"
)

invisible(lapply(packages, require, character.only = TRUE))
