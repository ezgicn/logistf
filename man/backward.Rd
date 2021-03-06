\name{backward}
\alias{backward}
\alias{forward}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Backward Elimination of Model Terms in \code{logistf} Models
}
\description{
These functions provide simple backward elimination/forward selection procedures for logistf models
}
\usage{
backward(object, scope, steps = 1000, slstay = 0.05, trace = TRUE,
   printwork = FALSE, ...)
forward(object, scope, steps = 1000, slentry = 0.05, trace = TRUE, 
 printwork = FALSE, pl = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
A fitted logistf model object. To start with an empty model, create a model fit with a formula=<y>~1, pl=FALSE. (Replace <y> by your response variable.)}
  \item{scope}{
The scope of variables to add/drop from the model. If left blank, \code{backward} will use the terms of the \code{object} fit, and \code{forward} will use all variables in \code{object$data} not identified as
the response variable. Alternatively, an arbitrary vector of variable names can be given, to allow that only some of the variables will be competitively selected or dropped.
}
  \item{steps}{
The number of forward selection/backward elimination steps.
}
  \item{slstay}{
For \code{backward}, the significance level to stay in the model.}
  \item{slentry}{
For \code{forward}, the significance level to enter the model.}

  \item{trace}{
If TRUE, protocols selection steps.
}
  \item{printwork}{
If TRUE, prints each working model that is visited by the selection procedure.
}
  \item{pl}{
For \code{forward}, computes profile likelihood confidence intervals for the final model if TRUE.
}
  \item{\dots}{
Further arguments to be passed to methods.}
}
\details{
The variable selection is simply performed by repeatedly calling add1 or drop1 methods for logistf, and is based on penalized likelihood ratio test. It can also properly handle variables that were defined as factors in the original
data set.
}
\value{
An updated logistf fit with the finally selected model.
}
\author{
Georg Heinze
}
\examples{
data(sex2)
fit<-logistf(data=sex2, case~1, pl=FALSE)
fitf<-forward(fit)

fit2<-logistf(data=sex2, case~age+oc+vic+vicl+vis+dia)
fitb<-backward(fit2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ regression}% __ONLY ONE__ keyword per line
