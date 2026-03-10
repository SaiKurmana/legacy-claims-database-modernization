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

DBI::dbExecute(con, paste(readLines(here::here("sql", "aws", "04_reporting_views.sql")), collapse = "\n"))

monthly <- DBI::dbGetQuery(con, "
SELECT *
FROM vw_monthly_claim_summary
ORDER BY service_month, product_line
")

monthly <- monthly %>%
  dplyr::mutate(
    paid_ratio = ifelse(billed_amount == 0, NA, paid_amount / billed_amount)
  )

readr::write_csv(monthly, here::here("output", "extracts", "monthly_claim_summary.csv"))
log_message("Monthly claims summary written to output/extracts/monthly_claim_summary.csv")

DBI::dbDisconnect(con)