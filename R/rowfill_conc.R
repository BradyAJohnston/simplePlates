#' Generate dilution series.
#'
#' Generates a dilution series starting at max_conc. Default diltuion factor = 0.5.
#' @param max_conc The maximum value in the dilution series.
#' @param num_dil The number of values in the dilution series (indluding the max_conc)
#' @param dil_factor The dilution factor for the series. Defatuls = 0.5
#' @keywords plate, dilution, concentration
#' @export
#' @examples
#'
#' rowfill_conc(100, 5, dil_factor = 0.5)


rowfill_conc <- function(max_conc, num_dil, dil_factor = 0.5){
  max_conc * dil_factor^(0:(num_dil))
}
