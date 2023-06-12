application <- readLines("application/application_base.yml")

readRenviron(".env")

vars <- c(
    "DOMAIN",
    "REGION",
    "CLIENT_ID",
    "CLIENT_SECRET",
    "POOL_ID",
    "REDIRECT"
)

# x <- vars[1]
# stringr::str_replace(application[which(stringr::str_detect(application, stringr::str_replace(x, "_", "-")))], paste0("\\$\\{", x, "\\}"), Sys.getenv(x))

purrr::map(vars, function(x) {
    x2 <- x1 <- x
    # x2 <- stringr::str_replace(x, "_", "-")
    application[which(stringr::str_detect(application, x2))] <<- stringr::str_replace(application[which(stringr::str_detect(application, x2))], paste0("\\$\\{", x2, "\\}"), Sys.getenv(x1))
    NULL
})

write(application, file = "application/application.yml")
