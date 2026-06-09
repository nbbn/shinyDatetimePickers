#' @importFrom shiny registerInputHandler
#' @import lubridate
#' @noRd
.onLoad <- function(...) {
  shiny::registerInputHandler(
    "shinyDatetimePickers.date",
    function(data, ...) {
      sec <- if (is.null(data[["time"]][["second"]])) {
        0
      } else {
        data[["time"]][["second"]]
      }
      make_datetime(
        year = data[["date"]][["year"]],
        month = data[["date"]][["month"]],
        day = data[["date"]][["date"]],
        hour = data[["time"]][["hour"]],
        min = data[["time"]][["minute"]],
        sec = sec,
        tz = Sys.timezone()
      )
    },
    force = TRUE
  )
}
