#'  Make a plate-properties dataframe.
#'
#' Function for creating plate properties given column, row range and sample contents.
#' Optional concentration, dilution factor and direction (for dilution series).
#' @param rows Vector of letters or numbers to generate row labels. If numeric LETTERS[rows]
#' @param cols Vector of numbers to generate column values.
#' @param conc If no dilution, constant concentration. If dilution, highest concentration in the dilution series.
#' @param dil Numeric between 0 and 1 to represent dilution series. 1:1 dilution = 0.5.
#' @param direction If !is.na(dil) then direction dictates if this dilution is performed across the columns (horizontal) or down the rows (vertical). Defaults to horizontal.

#' @keywords plate, dilution, concentrations
#' @export
#' @examples
#'
#' make_plate(rows = 1:3, cols = 1:2, sample = c("foo", "bar"))
#' make_plate(rows = 1:3, cols = 1:2, sample = c("foo", "bar"), conc = 500, dil = 0.5)

make_plate <- function(
  rows,
  cols,
  sample,
  conc = NA,
  dil = NA,
  direction = "horizontal"
) {
  if (is.numeric(rows)) {
    rows <- LETTERS[rows]
  } #else (is.character(rows))
  # else {
  #   stop("Rows must be either character or numeric vector")
  #   }

  plate <- data.frame(
    wells = make_wells(rows, cols),
    cols = cols,
    rows = rep(rows, each = length(cols)),
    sample = sample
  )

  if (direction == "horizontal"){
    num_dil = length(cols) - 1
  } else if (direction == "vertical") {
    num_dil = length(rows) - 1
  }

  if (is.numeric(conc)){
    plate$conc <- conc

    if (is.numeric(dil)) {
      concentrations <- rowfill_conc(
        max_conc = conc,
        num_dil = num_dil,
        dil_factor = dil
      )
    if (direction == "vertical") {
      plate$conc <- rep(concentrations, each = length(cols))
    } else if (direction == "horizontal") {
      plate$conc <- rep(concentrations, times = length(rows))
    }

    }
  }

  plate

}


