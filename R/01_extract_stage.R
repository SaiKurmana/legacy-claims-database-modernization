source(here::here("R", "00_packages.R"))
source(here::here("R", "utils.R"))

cfg <- get_config()

con <- DBI::dbConnect(
  RPostgres::Postgres(),
  host = cfg$db$host,
  port = cfg$db$port,
  dbname = cfg$db$name,
  user = cfg$db$user,
  password = cfg$db$password
)

tables <- c("members", "providers", "claims", "claim_lines", "claim_diagnoses")

for (tbl in tables) {
  f <- here::here("data-raw", paste0(tbl, ".csv"))
  dat <- readr::read_csv(f, show_col_types = FALSE)
  DBI::dbWriteTable(con, tbl, dat, append = TRUE, overwrite = FALSE)
  log_message(paste("Loaded", tbl, "from", f))
}

DBI::dbDisconnect(con)
