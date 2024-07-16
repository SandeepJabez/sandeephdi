#' Summary Method for HDRO Data Class
#'
#' This function provides a summary for objects of class `hdro_data`.
#'
#'Task 4
#' @param object An object of class `hdro_data`.
#' @param ... Additional arguments passed to the summary method.
#' @export
summary.hdro_data <- function(object, ...) {
  cat("Summary of HDRO Data Object\n")
  cat("----------------------------\n")
  cat("Number of rows: ", nrow(object), "\n")
  cat("Number of columns: ", ncol(object), "\n")
  cat("\nColumn names and types:\n")
  print(sapply(object, class))
  cat("\nSummary of numerical columns:\n")
  print(summary(object[sapply(object, is.numeric)]))
  cat("\nSummary of categorical columns:\n")
  lapply(object[sapply(object, is.factor)], function(x) print(summary(x)))
}
