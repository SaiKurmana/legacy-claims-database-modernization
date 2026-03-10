get_config <- function(path = here::here("config", "config.yml")) {
  yaml::read_yaml(path)
}

log_message <- function(msg, logfile = here::here("logs", "pipeline.log")) {
  line <- paste0(format(Sys.time(), "%Y-%m-%d %H:%M:%S"), " | ", msg, "\n")
  cat(line, file = logfile, append = TRUE)
}
