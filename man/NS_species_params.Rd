\docType{data}
\name{NS_species_params}
\alias{NS_species_params}
\alias{NS_species_params_gears}
\title{Example parameters data sets}
\description{
  There are two example data sets, \code{NS_species_params}
  and \code{NS_species_params_gears} based on species in
  the North Sea (Blanchard et el.) They are both data
  frames and are identical except that one has an
  additional column specifying the fishing gear that
  operates on each species. The data frames contain all the
  necessary information to be used by the
  \code{\link{MizerParams}} constructor. The data set
  without a fishing gear column will set up a model in
  which each species is fished by a separate gear.
}
\references{
  The North Sea paper (Blanchard et al)
}
\seealso{
  \code{MizerParams}
}
\keyword{datasets}

