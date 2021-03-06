% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plate_map.R
\name{plate_map}
\alias{plate_map}
\title{Plate map.}
\usage{
plate_map(df, cols, rows, alpha = NULL, colour = NULL, dot_size = 8)
}
\arguments{
\item{df}{Dataframe that contains plate values to be plotted.}

\item{cols}{Column of dataframe that contain column values (eg. 1-12)}

\item{rows}{Column of dataframe that contains row values (eg A-H)}

\item{alpha}{Column to control alpha value (can be blank).}

\item{colour}{Column to control colour value (can be blank).}
}
\description{
Generates visual plate map from inputted plate properties.
}
\examples{
# Requires ggplot2

df <- make_plate(1:8, 1:12, rep( c("sample1", "sample2", "sample3")))
head(df)
plate_map(df, cols = "cols", rows = "rows", colour = "sample")
}
\keyword{concentrations,}
\keyword{dilution,}
\keyword{map,}
\keyword{plate,}
\keyword{platemap,}
