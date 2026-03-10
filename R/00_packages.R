packages <- c(
  "DBI", "RPostgres", "readr", "dplyr", "dbplyr",
  "glue", "here", "yaml", "jsonlite", "lubridate",
  "testthat", "ggplot2", "knitr", "rmarkdown", "quarto"
)

invisible(lapply(packages, require, character.only = TRUE))
