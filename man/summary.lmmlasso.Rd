\name{summary.lmmlasso}
\alias{summary.lmmlasso}
\title{Summarize an lmmlasso object}
\description{Providing an elaborate summary of a \code{lmmlasso} object.}
\usage{
\method{summary}{lmmlasso}(object, ...)
}

\arguments{
  \item{object}{a \code{lmmlasso} object}
  \item{\dots}{not used.}
}
\details{This functions shows a detailed summary of a \code{lmmlasso}
  object. In the fixed-effects part, (n) right from a fixed-effects
  coefficient means that this coefficient was not subject to penalization.}

\examples{
data(classroomStudy)
fit <-
lmmlasso(x=classroomStudy$X,y=classroomStudy$y,z=classroomStudy$Z,
grp=classroomStudy$grp,lambda=15,pdMat="pdIdent")
summary(fit)
}

\keyword{methods}
