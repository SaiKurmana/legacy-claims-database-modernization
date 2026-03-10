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

dupes <- DBI::dbGetQuery(con, "
SELECT claim_id, COUNT(*) AS cnt
FROM claims
GROUP BY claim_id
HAVING COUNT(*) > 1
")

orphans <- DBI::dbGetQuery(con, "
SELECT cl.claim_line_id
FROM claim_lines cl
LEFT JOIN claims c ON cl.claim_id = c.claim_id
WHERE c.claim_id IS NULL
")

null_critical <- DBI::dbGetQuery(con, "
SELECT claim_id
FROM claims
WHERE member_id IS NULL
   OR provider_id IS NULL
   OR service_from_date IS NULL
   OR claim_status IS NULL
")

results <- dplyr::bind_rows(
  data.frame(test_name = "duplicate_claims", actual_value = nrow(dupes), pass_flag = nrow(dupes) == 0),
  data.frame(test_name = "orphan_claim_lines", actual_value = nrow(orphans), pass_flag = nrow(orphans) == 0),
  data.frame(test_name = "null_critical_claim_fields", actual_value = nrow(null_critical), pass_flag = nrow(null_critical) == 0)
)

readr::write_csv(results, here::here("output", "logs", "validation_results.csv"))
log_message("Validation checks completed")

DBI::dbDisconnect(con)
