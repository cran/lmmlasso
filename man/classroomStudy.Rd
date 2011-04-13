\name{classroomStudy}
\alias{classroomStudy}
\docType{data}
\title{Dataset of students math achievements}
\description{This is a subset of the Classroom Study described in West
  et. al. (2007) with 156 observations and 6 variables.
}
\usage{data(classroomStudy)}
\format{
  \describe{
   A list with the following four components.
   \item{y}{Response variable. The students math achievement gain.}
   \item{grp}{Grouping variable comprising the class of the students.}
   \item{X}{Fixed-effect design matrix. The first column is the intercept,
   then sex, minority, mathkind, ses, yearstea and mathprep.}
   \item{Z}{Random-effects design matrix. Only one column in order to fit
   a random intercept model.}
  }
}
\details{
A detailed description of the covariates can be found in West
et. al. (2007) and was carried out by Hill et. al. (2005)
}
\source{
\url{http://www-personal.umich.edu/~bwest/classroom.csv}
}
\references{
Brady T. West, Kathleen B. Welch and Andrzei T. Galecki (2007),
\emph{Linear Mixed Models, A Practical Guide Using Statistical
  Software},Chapman and Hall.

H.C. Hill, B. Rowan and D.L. Ball (2005) \emph{"Effect of teachers"
  mathematical knowledge for teaching on student achievements}, American
Educational Research Journal, 42, 371-406.
}

\examples{
data(classroomStudy)
}
\keyword{datasets}
