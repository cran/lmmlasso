\name{plot.lmmlasso}
\alias{plot.lmmlasso}
\title{Diagnostic Plots for a lmmlasso object}
\description{Plots six diagnostic plots for checking the model
  assumptions and supporting model selection for a \code{lmmlasso} object}
\usage{
\method{plot}{lmmlasso}(x, ...)
}

\arguments{
  \item{x}{a \code{lmmlasso} object}
  \item{\dots}{not used.}
}
\details{\code{plot.lmmlasso} shows six diagnostic plots which support
  checking the model assumption, model fit and may give hints for
  another model. 1) The first plot depicts the Tukey-Anscombe plot in
  order to check the assumptions about the errors. Points with the same
  color belong to the same group. 2) QQ-Plot of the
  residuals with equal coloring for each group. 3) QQ-Plot of the
  predicted random effects. Be careful with the interpretation since the
  random effects have not been standardized. The color shows which
  points belong to the same random-effects covariate. 4) Boxplot of the
  predicted random effects for each random-effects variable. 5) Plot of
  the fitted y-values against the observed y-values. 6) A histogram of
  the fixed-effects coefficients. 
}

\examples{
data(classroomStudy)
fit <- lmmlasso(x=classroomStudy$X,y=classroomStudy$y,z=classroomStudy$Z,grp=classroomStudy$grp,lambda=15,pdMat="pdIdent")
plot(fit)
}
\keyword{hplot}
