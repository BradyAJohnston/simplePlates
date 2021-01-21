#' Plate map.
#'
#' Generates visual plate map from inputted plate properties.
#' @param df Dataframe that contains plate values to be plotted.
#' @param cols Column of dataframe that contain column values (eg. 1-12)
#' @param rows Column of dataframe that contains row values (eg A-H)
#' @param alpha Column to control alpha value (can be blank).
#' @param colour Column to control colour value (can be blank).

#' @keywords plate, dilution, concentrations, platemap, map,
#' @export
#' @examples
#' # Requires ggplot2
#'
#' df <- make_plate(1:8, 1:12, rep( c("sample1", "sample2", "sample3")))
#' head(df)
#' plate_map(df, cols = "cols", rows = "rows", colour = "sample")

plate_map <- function(df,
                      cols,
                      rows,
                      alpha = NULL,
                      colour = NULL,
                      dot_size = 8) {

  mapping <- aes(
    x = .data[[cols]],
    y = .data[[rows]],
    alpha = .data[[alpha]],
    colour = .data[[colour]]
  )

  if(is.null(alpha)) {
    mapping$alpha <- NULL
  }
  if(is.null(colour)) {
    mapping$colour <- NULL
  }

  the_plot <-
    ggplot(data = df,
           mapping = mapping) +
    geom_point(size = dot_size) +
    scale_x_continuous(position = "top",  breaks = 1:24) +
    # scale_y_discrete(trans = "reverse")
    theme(
      aspect.ratio = 8 / 12,
      axis.ticks = element_blank(),
      plot.background = element_blank(),
      panel.background = element_rect(
        fill = "transparent",
        colour = "black",
        size = 2
      ),
      panel.grid = element_blank()
    ) +
    labs(
      x = "",
      y = "",
      colour = "Sample",
      alpha = "Concentration"
    )

  the_plot
}
