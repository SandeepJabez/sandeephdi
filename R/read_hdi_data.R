#' Read HDRO Indicator File
#'
#' This function reads an HDRO indicators CSV file and assigns appropriate data types to the columns.
#'
#' @param file_path The path to the HDRO indicators CSV file.
#' @return An object of class `hdro_data` with correctly assigned data types and cleaned column names.
#' @examples
#' df <- read_hdro_file("path/to/hdro_indicators_COUNTRYNAME.csv")
#' @export
read_hdro_file <- function(file_path) {
  library(readr)
  library(dplyr)
  library(lubridate)

  # Read the CSV file with the first row as headers
  df <- read_csv(file_path, col_names = FALSE)

  # Assign proper column names
  col_names <- c("country_code", "country_name", "indicator_id", "indicator_name", "index_id", "index_name", "value", "year")
  names(df) <- col_names

  # Remove the first two rows as they contain headers
  df <- df[-c(1, 2), ]

  # Clean the year column to ensure it contains only numeric values
  df$year <- gsub("[^0-9]", "", df$year)

  # Convert columns to appropriate data types
  df <- df %>%
    mutate(
      country_code = as.factor(country_code),
      country_name = as.factor(country_name),
      indicator_id = as.factor(indicator_id),
      indicator_name = as.factor(indicator_name),
      index_id = as.factor(index_id),
      index_name = as.factor(index_name),
      value = as.numeric(gsub(",", "", value)), # Handle commas in numbers, if any
      year = ymd(paste0(year, "-01-01")) # Convert year to date format
    )

  # Handle any potential NAs introduced by coercion
  na_value_count <- sum(is.na(df$value))
  na_year_count <- sum(is.na(df$year))
  if (na_value_count > 0) {
    warning(paste("There were", na_value_count, "NAs introduced in the 'value' column during conversion."))
  }
  if (na_year_count > 0) {
    warning(paste("There were", na_year_count, "NAs introduced in the 'year' column during conversion."))
  }

  # Return the data frame as an object of class 'hdro_data'
  return(create_hdro_data(df))
}
