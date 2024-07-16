#' Print Method for HDRO Data Class
#'
#' This function defines how objects of class `hdro_data` are printed
#'
#'Task 3 of the HDI project
#' @param x An object of class `hdro_data`.
#' @param ... Additional arguments passed to the print method.
#' @export
print.hdro_data <- function(x, ...) {
  cat("HDRO Data Object\n")
  cat("----------------\n")
  cat("Number of rows: ", nrow(x), "\n")
  cat("Number of columns: ", ncol(x), "\n")
  cat("Column names:\n")
  print(names(x))
  cat("\nPreview of data:\n")
  print(head(x))
}
