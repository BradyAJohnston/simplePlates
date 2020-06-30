#' Create plate properties.
#'
#' Generates concentrations, row / column labels and well contents from input.
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
#'
#' create_plate_properties(LETTERS[1:3], 1:3, 500, "Normal")
#' create_plate_properties(LETTERS[1:3], 1:3, 500, "vertical_values", direction = "vertical")
#' create_plate_properties(LETTERS[1:3], 1:3, 500, "constant_values", constant_concentration = T)

create_plate_properties <- function(row_range, column_range, max_conc, well_contents, direction = "horizontal", dil_factor = 0.5, constant_concentration = FALSE){



    if(constant_concentration == FALSE){
    }else if(constant_concentration == TRUE){
      dil_factor = 1
    }else {
      print("Error, constant_concentration must be either TRUE/FALSE")
      break
    }


  if(direction =="horizontal"){
    num_dil = length(column_range)

  row_let <- c("A")
  col_no <- c(1)
  sample_con <- c(10)
  sample_index <- c(1)

  index <- 0

  for(l in 1:length(row_range)){

    conc <- rowfill_conc(max_conc, dil_factor = dil_factor, num_dil = num_dil)

    for(i in column_range){
      index <- index + 1

      row_let[index] <- row_range[l]
      col_no[index] <- i
      sample_con[index] <- conc[i]
    }
  }

  some_df <- data.frame(
    well = paste(row_let, col_no, sep = ""),
    row_let = row_let,
    col_no = col_no,
    sample_con = sample_con,
    well_contents = well_contents
  )
  }else if(direction =="vertical"){
    num_dil = length(row_range)

      row_let <- c("A")
      col_no <- c(1)
      sample_con <- c(10)
      sample_index <- c(1)

      index <- 0

      for(l in 1:length(row_range)){

        conc <- rowfill_conc(max_conc, dil_factor = dil_factor, num_dil = num_dil)

        for(i in column_range){
          index <- index + 1

          row_let[index] <- row_range[l]
          col_no[index] <- i
          sample_con[index] <- conc[l]
        }
      }

      some_df <- data.frame(
        well = paste(row_let, col_no, sep = ""),
        row_let = row_let,
        col_no = col_no,
        sample_con = sample_con,
        well_contents = well_contents
      )
  }else {
      print("Error, direction must be either 'vertical' or 'horizontal'.")
    }


  return(some_df)
}
