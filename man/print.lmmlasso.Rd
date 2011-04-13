\name{print.lmmlasso}
\alias{print.lmmlasso}
\title{Print a short summary of a lmmlasso object.}
\description{Prints a short summary of an \code{lmmlasso} object
  comprising information about the variance components parameters and
  the number of nonzero fixed-effects coefficients.}
\usage{
\method{print}{lmmlasso}(x, ...)
}

\arguments{
  \item{x}{a \code{lmmlasso} object}
  \item{\dots}{not used}
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{summary.lmmlasso}
}
\examples{
data(classroomStudy)
fit <-
lmmlasso(x=classroomStudy$X,y=classroomStudy$y,z=classroomStudy$Z,
grp=classroomStudy$grp,lambda=15,pdMat="pdIdent")
print(fit)
}

