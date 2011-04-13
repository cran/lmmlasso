\name{lmmlasso-internal}
\alias{ArmijoRule}
\alias{MLpdSymObj}
\alias{SoftThreshold}
\alias{HessianMatrix}
\alias{MLsigma}
\alias{ZIdentity}
\alias{LambdaInv}
\alias{MLsigmaFct}
\alias{as1}
\alias{MLloglik}
\alias{MLsigmaLambda}
\alias{as2}
\alias{MLpdDiag}
\alias{MLsigmaZPsiZt}
\alias{nlogdet}
\alias{MLpdIdent}
\alias{MedianValue}
\alias{covStartingValues}
\alias{MLpdIdentFct}
\alias{MLpdSym}
\alias{MyQuadFormInv}
\alias{MLpdSymFct}
\alias{ObjFunction}
\alias{MLpdSymLambda}
\alias{ResAsSplit}
\title{Internal lmmlasso objects}
\description{Internal lmmlasso objects.}
\usage{
ArmijoRule(xGroup, yGroup, LGroup, b, j, cut, HkOldJ, HkJ, JinNonpen,
lambda, weights, nonpen, ll1, ll2, converged, control)
MLpdSymObj(Lambda, res)
SoftThreshold(z, g)
HessianMatrix(xGroup, LGroup, activeSet, N, hessian, mat)
MLsigma(zGroup, zIdGroup, resGroup, q, ll1, ll4, true.sigma, Psi, trace,
CovOpt, VarInt)
ZIdentity(Z)
LambdaInv(Z, ZId, Psi, sigma)
MLsigmaFct(sigma, ZPZtGroup, zIdGroup, resGroup)
as1(xGroup, LGroup, activeSet, N)
MLloglik(xGroup, yGroup, LGroup, b, ntot, N, activeSet)
MLsigmaLambda(ZId, ZPZt, sigma)
as2(x, y, b, j, activeSet, group, sGroup)
MLpdDiag(zGroup, resGroup, zIdGroup, sigma, pars, q, thres = 10^(-4),
ll1, ll4, trace, CovOpt, VarInt)
MLsigmaZPsiZt(Z, Psi)
nlogdet(LGroup)
MLpdIdent(zGroup, resGroup, zIdGroup, sigma, pars, q, thres = 10^(-4),
ll1, ll4, trace, CovOpt, VarInt)
MLpdSym(zGroup, resGroup, zIdGroup, sigma, pars, q, thres = 10^(-4),
ll1, ll4, trace, CovOpt, CovInt, VarInt)
MedianValue(grad, hessian, lambda, bj)
covStartingValues(xGroup, yGroup, zGroup, zIdGroup, b, ntot, N, lower =
-10, upper = 10)
MLpdIdentFct(thetak, zGroup, zIdGroup, resGroup, sigma, LPsi)
MLpdSym(zGroup, resGroup, zIdGroup, sigma, pars, q, thres = 10^(-4),
ll1, ll4, trace, CovOpt, CovInt, VarInt)
MyQuadFormInv(M, x)
MLpdSymFct(thetak, zGroup, zIdGroup, resGroup, sigma, a, b, LPsi)
ObjFunction(xGroup, yGroup, LGroup, b, weights, lambda, nonpen, resGroup
= NULL, ll1 = ll1, ll2 = NULL)
MLpdSymLambda(Z, ZId, Psi, sigma)
ResAsSplit(x, y, b, f, activeset)
}
\details{These are not to be called by the user.}
\keyword{internal}