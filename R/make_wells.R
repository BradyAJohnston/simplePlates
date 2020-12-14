#' Create well labels.
#'
#' Generates well labels (e.g. A1-H12) for given range of letters and numbers.
#' Letters can either be a character of numeric range.
#' @param let Character or numeric vector for letters component. If numeric will become LETTERS[let]
#' @param num Numeric vector for column numbers.
#' @keywords plate, wells
#' @export
#' @examples
#'
#' make_wells(LETTERS[1:2], 1:8)
#' make_wells(1:2, 1:8)

make_wells <- function(
  let,
  num
) {
  if (is.numeric(let)){
    if (any(let > 26 | let < 0)) stop("For numeric vectors let must be 0 < let < 26.")
      let <- LETTERS[let]
  } else if (is.character(let)){
  } else {
    stop("let must be either numeric of character vector.")
  }


  if (is.numeric(num)) {
    num <- num
  } else{
    stop("num must be a numeric vector")
    }

  paste0(rep(let, each = length(num)), rep(num, length(let)))
}




