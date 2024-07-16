#' Constructor for HDRO Data Class
#'
#' This function creates a new S3 class `hdro_data`.
#'
#' @param data A data frame containing HDRO indicators.
#' @return An object of class `hdro_data`.
#' @export
create_hdro_data <- function(data) {
  class(data) <- c("hdro_data", class(data))
  return(data)
}
