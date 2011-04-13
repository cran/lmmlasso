\name{lmmlasso}
\alias{lmmlasso}
\alias{lmmlasso.default}
\title{Function to fit high-dimensional (gaussian) linear mixed-effects models}
\description{Fits the solution for a high-dimensional (gaussian) linear mixed-effects models}
\usage{
lmmlasso(x, ...)

\method{lmmlasso}{default}(x, y, z = x, grp, weights = NULL,coefInit=NULL, lambda,
 startValue = 1, nonpen = 1:dim(z)[[2]], pdMat = c("pdIdent", "pdDiag","pdSym"),
 method = "ML", CovOpt = c("nlminb","optimize"), stopSat = TRUE,
 standardize = TRUE, control = lmmlassoControl(),ranInd=1:dim(z)[[2]],...)}

\arguments{
  \item{x}{matrix of dimension ntot x p including the fixed-effects covariables. An intercept has to be included in the first column as (1,...,1).}
  \item{y}{response variable of length ntot.}
  \item{z}{random effects matrix of dimension ntot x q. It has to be a matrix, even if q=1.}
  \item{grp}{grouping variable of length ntot}
  \item{weights}{weights for the fixed-effects covariates: NA means no
    penalization, 0 means drop this covariate ; if given, the argument
    nonpen is ignored. By default each covariate has weight 1}
  \item{coefInit}{list with three components used as starting values for
    the fixed effects, the random effects variance components and the error standard deviation.}
  \item{lambda}{positive regularization parameter}
  \item{startValue}{Choice of the starting values for the fixed effects
    using linear regression. 1 means 10-fold cross-validation with
    L1-penalty, 2 means 10-fold cross-validation Ridge Regression and 0
    means that all the covariates are set to zero and the intercept is
    the mean of the response variable}
  \item{nonpen}{index of fixed effects with no penalization, ignored if
    the argument weights is specified, default is 1, which means that only the intercept (the first column in X )is not penalized.}
  \item{pdMat}{Covariance structure for the random effects. pdIdent,
    pdDiag and pdSym are already implemented. Default to
    pdIdent. pdIdent: \eqn{b_i \sim \mathcal{N}(0,\theta^2 I)} (1
    parameter), pdDiag: \eqn{b_i \sim \mathcal{N}(0,diag(\theta_1,\ldots,\theta_q))} (q parameters), pdSym: \eqn{b_i \sim \mathcal{N}(0,\Psi)} where \eqn{\Psi} is symmetric positive definit (\eqn{q(q+1)/2} parameters)}
  \item{method}{Only "ML" is allowed. "REML" is not yet implemented.}
  \item{CovOpt}{which optimization routine should be used for updating the variance components parameters. optimize or nlminb. nlminb uses the estimate                     of the last iteration as a starting value. nlminb is faster if there are many Gauss-Seidel iterations.}
  \item{stopSat}{logical. Should the algorithm stop when ntot > p?}
  \item{standardize}{Should the x matrix be standardized such that each column has mean 0 and standard deviation 1? Be careful if the x matrix includes dummy                    variables.}
  \item{control}{control parameters for the algorithm and the Armijo
    Rule, see \code{lmmlassoControl} for the details}
  \item{ranInd}{Index of the random effects with respect to the x matrix}
  \item{\dots}{not used.}
}

\details{
All the details of the algorithm can be found in Schelldorfer et. al. (2010).
}

\value{A \code{lmmlasso} object is returned, for which
  \code{coef},\code{resid}, \code{fitted}, 
  \code{print}, \code{summary}, \code{plot} methods exist.
  \item{coefficients}{estimated fixed-effects coefficients \eqn{\hat{\beta}}}
  \item{pars}{free parameters in the covariance matrix \eqn{\Psi} of the random effects}
  \item{sigma}{standard deviation \eqn{\hat{\sigma}} of the errors}
  \item{random}{vector with random effects, sorted by groups}
  \item{u}{vector with the standardized random effects, sorted by effect}
  \item{ranef}{vector with random effects, sorted by effect}
  \item{fixef}{estimated fixed-effects coeffidients \eqn{\hat{\beta}}}
  \item{fitted.values}{The fitted values \eqn{\hat{y} = \hat{X} \beta +
  Z \hat{b}_i}}
  \item{residuals}{raw residuals \eqn{y-\hat{y}}}
  \item{Psi}{Covariance matrix \eqn{\Psi} of the random effects}
  \item{corPsi}{Correlation matrix of the random effects}
  \item{logLik}{value of the log-likelihood function}
  \item{deviance}{deviance=-2*logLik}
  \item{npar}{Number of parameters. Corresponds to the cardinality
  of the active set of \code{coefficients} plus the number of free parameters
  in \code{Psi}}
\item{aic}{AIC}
\item{bic}{BIC}
  \item{data}{data set, as a list with four components: x, y, z, grp (see
    above)}
  \item{weights}{weights for the fixed-effects covariates}
  \item{nonpen}{nonpenalized covariates. Differ from the input if weights
  is explicitely given}
  \item{coefInit}{list with three components used as starting values}
  \item{lambda}{positive regularization parameter}
  \item{converged}{Does the algorithm converge? 0: correct convergence ;
  an odd number means that maxIter was reached ; an even number means
  that the Armijo step was not succesful. For each unsuccessfull Armijo
  step, 2 is added to converged. If converged is large compared to the
  number of iterations \code{counter}, you may increase maxArmijo.}
\item{counter}{The number of iterations used.}
\item{stopped}{logical. Does the algorithm stopped due to ntot > p?}
  \item{pdMat}{Covariance structure for the random effects}
  \item{method}{"ML"}
  \item{CovOpt}{optimization routine}
  \item{control}{see \code{lmmlassoControl}}
  \item{call}{call}
  \item{stopped}{logical. Does the algorithm stopped due to a too large
    active set?}
  \item{ranInd}{Index of the random effects with respect to the x
      matrix}
  \item{objective}{Value of the objective function at the final estimates}
}
\references{J. Schelldorfer, P. B\"uhlmann and S. van de Geer (2011), Estimation for High-Dimensional Linear Mixed-Effects
                  Models Using \eqn{\ell_1}-penalization, arXiv preprint 1002.3784v2}
\author{Juerg Schelldorfer, \email{schell@stat.math.ethz.ch}}


\examples{
# (1) Use the lmmlasso on the classroomStudy data set
data(classroomStudy)
fit1 <-
lmmlasso(x=classroomStudy$X,y=classroomStudy$y,z=classroomStudy$Z,
grp=classroomStudy$grp,lambda=15,pdMat="pdIdent")
summary(fit1)
plot(fit1)

# (2) Use the lmmlasso on a small simulated data set
set.seed(54)

N <- 20           # number of groups
p <- 6            # number of covariates (including intercept)
q <- 2            # number of random effect covariates
ni <- rep(6,N)    # observations per group
ntot <- sum(ni)   # total number of observations

grp <- factor(rep(1:N,each=ni)) # grouping variable

beta <- c(1,2,4,3,0,0,0) # fixed-effects coefficients
x <- cbind(1,matrix(rnorm(ntot*p),nrow=ntot)) # design matrix

bi1 <- rep(rnorm(N,0,3),each=ni) # Psi=diag(3,2)
bi2 <- rep(rnorm(N,0,2),each=ni)
bi <- rbind(bi1,bi2)
   
z <- x[,1:2,drop=FALSE]

y <- numeric(ntot)
for (k in 1:ntot) y[k] <- x[k,]\%*\%beta + t(z[k,])\%*\%bi[,grp[k]] + rnorm(1)

# correct random effects structure
fit2 <- lmmlasso(x=x,y=y,z=z,grp=grp,lambda=10,pdMat="pdDiag")
summary(fit2)
plot(fit2)

# wrong random effects structure
fit3 <- lmmlasso(x=x,y=y,z=x[,1:3],grp=grp,lambda=10,pdMat="pdDiag")
summary(fit3)
plot(fit3)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{regression}% __ONLY ONE__ keyword per line
