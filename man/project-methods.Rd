\docType{methods}
\name{project}
\alias{project}
\alias{project,MizerParams,array-method}
\alias{project,MizerParams,missing-method}
\alias{project,MizerParams,numeric-method}
\alias{project-method}
\title{project method for the size based modelling}
\arguments{
  \item{object}{A \code{MizerParams} object}

  \item{effort}{The effort of each fishing gear through
  time. See notes below.}

  \item{t_max}{The maximum time the projection runs for.
  The default value is 100. However, this argument is not
  needed if an array is used for the \code{effort}
  argument, in which case this argument is ignored. See
  notes below.}

  \item{dt}{Time step of the solver. The default value is
  0.1.}

  \item{t_save}{The frequency with which the output is
  stored. The default value is 1.}

  \item{initial_n}{The initial populations of the species.
  See the notes below.}

  \item{initial_n_pp}{The initial population of the
  background spectrum. It should be a numeric vector of the
  same length as the \code{w_full} slot of the
  \code{MizerParams} argument. By default the \code{cc_pp}
  slot of the \code{\link{MizerParams}} argument is used.}
}
\value{
  An object of type of \code{MizerSim}

  An object of type \code{MizerSim}.
}
\description{
  Runs the size-based model simulation and projects the
  size based model through time. \code{project} is called
  using an object of type \code{MizerParams} and an object
  that contains the effort of the fishing gears through
  time. The method returns an object of type
  \code{\link{MizerSim}} which can then be explored with a
  range of summary and plotting methods.
}
\note{
  The \code{effort} argument specifies the level of fishing
  effort during the simulation. It can be specified in
  three different ways: \itemize{ \item A single numeric
  value. This specifies the effort of all fishing gears
  which is constant through time (i.e. all the gears have
  the same constant effort). \item A numerical vector which
  has the same length as the number of fishing gears. The
  vector must be named and the names must correspond to the
  gear names in the \code{MizerParams} object. The values
  in the vector specify the constant fishing effort of each
  of the fishing gears, i.e. the effort is constant through
  time but each gear may have a different fishing effort.
  \item A numerical array with dimensions time step x gear.
  This specifies the fishing effort of each gear at each
  time step.  The first dimension, time, must be named
  numerically and contiguously. The second dimension of the
  array must be named and the names must correspond to the
  gear names in the \code{MizerParams} argument. }

  If effort is specified as an array then the \code{t_max}
  argument is ignored and the maximum simulation time is
  the taken from the dimension names.

  The \code{initial_n} argument is a matrix with dimensions
  species x size. The order of species must be the same as
  in the \code{MizerParams} argument. If the initial
  population is not specified, the argument is set by
  default by the \code{get_initial_n} function which is set
  up for a North Sea model.
}
\examples{
\dontrun{
# Data set with different fishing gears
data(NS_species_params_gears)
data(inter)
params <- MizerParams(NS_species_params_gears, inter)
# With constant fishing effort for all gears for 20 time steps
sim <- project(params, t_max = 20, effort = 0.5)
# With constant fishing effort which is different for each gear
effort <- c(Industrial = 0, Pelagic = 1, Beam = 0.5, Otter = 0.5)
sim <- project(params, t_max = 20, effort = effort)
# With fishing effort that varies through time for each gear
gear_names <- c("Industrial","Pelagic","Beam","Otter")
times <- seq(from = 1, to = 10, by = 1)
effort_array <- array(NA, dim = c(length(times), length(gear_names)),
    dimnames = list(time = times, gear = gear_names))
effort_array[,"Industrial"] <- 0.5
effort_array[,"Pelagic"] <- seq(from = 1, to = 2, length = length(times))
effort_array[,"Beam"] <- seq(from = 1, to = 0, length = length(times))
effort_array[,"Otter"] <- seq(from = 1, to = 0.5, length = length(times))
sim <- project(params, effort = effort_array)
}
}
\seealso{
  \code{\link{MizerParams}}
}

