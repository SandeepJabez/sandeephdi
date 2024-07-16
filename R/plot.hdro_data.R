#' Plot Method for HDRO Data Class
#'
#' This function creates a plot for objects of class `hdro_data`.
#'
#' @param x An object of class `hdro_data`.
#' @param indicator The indicator to be plotted.
#' @param ... Additional arguments passed to the plot method.
#' @export
plot.hdro_data <- function(x, indicator, ...) {
  library(ggplot2)

  # Filter data for the specified indicator
  data_to_plot <- x %>%
    filter(indicator_name == indicator)

  # Check if data is available for the specified indicator
  if(nrow(data_to_plot) == 0) {
    stop(paste("No data available for indicator:", indicator))
  }

  # Create the plot
  ggplot(data_to_plot, aes(x = year, y = value)) +
    geom_line(color = "blue") +
    labs(
      title = paste("Trend of", indicator, "over the Years"),
      x = "Year",
      y = indicator
    ) +
    theme_minimal()
}
