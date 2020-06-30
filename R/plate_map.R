#' Plate map.
#'
#' Generates visual plate map from inputted plate properties.
#' @param row_range Vector of letters to generate values for (e.g LETTERS[1:3])
#' @param column_range Vector of numbers to generate values for (e.g. 1:3)
#' @param max_conc Maximum concentration of dilution series for values.
#' @param well_contents String for label of what is in the well (e.g. "Sample1")
#' @param dil_factor Dilution factor for generating dilution series. Default = 0.5.
#' @param constant_concentration TRUE/FALSE. TRUE = only 1 concentration for all values. FALSE = generating dilution series.
#' @param direction String either "horizontal" (default) or "vertical". "horizontal" makes dilution series go across numbered colums, "vertical" makes diultion series go down the letterd rows.
#' @keywords plate, dilution, concentrations
#' @export
#' @examples
#' # Requires ggplot2
#'
#' df <- create_plate_properties(LETTERS[1:8], 1:12, max_conc = 1000, well_contents = "SampleA")
#' head(df)
#' plate_map(df = df, alpha_value = sample_con, colour_value = well_contents)


plate_map <- function(df, alpha_value, colour_value, plate_size = 96, dot_size=10){
   if(plate_size == 96){
    df$row_let <- factor(x = df$row_let, ordered = T, levels = LETTERS[8:1])
    }else if(plate_size == 384){
    df$row_let <- factor(x = df$row_let, ordered = T, levels = LETTERS[16:1])
    }else if(plate_size == 24){
    df$row_let <- factor(x = df$row_let, ordered = T, levels = LETTERS[4:1])
    }else{print("Unsupported plate size provided.")}

  the_plot <- ggplot(df, aes(x = col_no, y = row_let, alpha = sample_con, colour = well_contents)) +
    geom_point(size = dot_size) +
    scale_x_continuous(breaks = unique(df$col_no), position = "top") +
    # scale_y_discrete(trans = "reverse")
    theme(aspect.ratio = 8/12,
      axis.ticks = element_blank(),
      plot.background = element_blank(),
      panel.background = element_rect(fill = "transparent", colour = "black", size = 2),
      panel.grid = element_blank()) +
    labs(x = "", y = "", colour = "Sample", alpha = "Concentration")

  return(the_plot)
}

