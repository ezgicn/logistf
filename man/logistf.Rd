\name{logistf}
%- Also NEED an '\alias' for EACH other topic documented here.
\alias{logistf}
\title{
Firth's Bias-Reduced Logistic Regression
}
\description{
Implements Firth's bias-Reduced penalized-likelihood logistic regression.
}
\usage{
logistf(formula = attr(data, "formula"), data = sys.parent(), pl = TRUE, 
   alpha = 0.05, control, plcontrol, firth = TRUE, init, weights, 
   plconf = NULL, dataout = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{
a formula object, with the response on the left of the  operator, and the
    model terms on the right. The response must be a vector with 0 and 1 or FALSE and
    TRUE for the  outcome, where the higher value (1 or TRUE) is modeled. It is possible
    to include contrasts, interactions, nested effects, cubic or polynomial splines and all
    S features as well, e.g. \code{Y ~ X1*X2 + ns(X3, df=4)}. From version 1.10, you may also include
    offset() terms.
    }
  \item{data}{
  a data.frame where the variables named in the formula can be found, i. e.
    the variables containing the binary response and the covariates.
    }
  \item{pl}{
specifies if confidence intervals and tests should be based on the profile penalized
    log likelihood (\code{pl=TRUE}, the default) or on the Wald method (\code{pl=FALSE}).
    }
  \item{alpha}{
the significance level (1-\eqn{\alpha} the confidence level,
    0.05 as default).}
  \item{control}{
Controls Newton-Raphson iteration. Default is \code{control=} \code{logistf.control(maxstep,}
 \code{maxit, maxhs, lconv, gconv, xconv})
}
  \item{plcontrol}{
Controls Newton-Raphson iteration for the estimation of the profile likelihood confidence intervals.
       Default is \code{plcontrol=} \code{logistpl.control(maxstep,} 
       \code{maxit,}  \code{maxhs, lconv, xconv, ortho, pr})
}
  \item{firth}{
use of Firth's penalized maximum likelihood (\code{firth=TRUE}, default) or the
    standard maximum likelihood method (\code{firth=FALSE}) for the logistic regression. Note
    that by specifying \code{pl=TRUE} and \code{firth=FALSE} (and probably a lower number of iterations)
  one obtains profile likelihood confidence intervals for maximum likelihood logistic
  regression parameters.
}
  \item{init}{
specifies the initial values of the coefficients for the fitting algorithm.
}
  \item{weights}{
specifies case weights. Each line of the input data set is multiplied by the corresponding element of \code{weights}.
}
  \item{plconf}{
specifies the variables (as vector of their indices) for which profile likelihood confidence intervals should
                be computed. Default is to compute for all variables.
}
  \item{dataout}{
If TRUE, copies the \code{data} set to the output object.
}
  \item{\dots}{
Further arguments to be passed to logistf.
}
}
\details{
\code{logistf} is the main function of the package. It fits a logistic regression model applying Firth's correction to the likelihood. 
The following generic methods are available for \code{logistf}`s output
object: \code{print}, \code{summary}, \code{coef}, \code{vcov}, \code{confint}, \code{anova}, \code{extractAIC}, \code{add1}, \code{drop1}, \code{profile}, \code{terms}, \code{nobs}.
Furthermore, \code{forward} and \code{backward} functions perform convenient variable selection. Note that \code{anova}, \code{extractAIC},  \code{add1}, \code{drop1},   \code{forward} and \code{backward} 
are based on penalized likelihood ratios.
}
\value{
  The object returned is of the class logistf and has the following attributes:
  \item{coefficients}{ the coefficients of the parameter in the fitted model.}
  \item{alpha}{ the significance level (1- the confidence level) as specified in the input.}
  \item{terms}{the column names of the design matrix}
  \item{var}{ the variance-covariance-matrix of the parameters.}
  \item{df}{ the number of degrees of freedom in the model.}
  \item{loglik}{ a vector of the (penalized) log-likelihood of the full and the restricted models.}
  \item{iter}{ the number of iterations needed in the fitting process.}
  \item{n}{ the number of observations.}
  \item{y}{ the response-vector, i. e. 1 for successes (events) and 0 for failures.}
  \item{formula}{ the formula object.}
  \item{call}{ the call object.}
  \item{terms}{the model terms (column names of design matrix).}
  \item{linear.predictors}{ a vector with the linear predictor of each observation.}
  \item{predict}{ a vector with the predicted probability of each observation.}
  \item{hat.diag}{ a vector with the diagonal elements of the Hat Matrix.}
  \item{conv}{the convergence status at last iteration: a vector of length 3 with elements: last change in log likelihood, max(abs(score vector)), max change in beta at last iteration.}
  \item{method}{ depending on the fitting method `Penalized ML' or `Standard ML'.}
  \item{method.ci}{ the method in calculating the confidence intervals, i.e. `profile likelihood' or `Wald', depending on the argument pl.}
  \item{ci.lower}{ the lower confidence limits of the parameter.}
  \item{ci.upper}{ the upper confidence limits of the parameter.}
  \item{prob}{ the p-values of the specific parameters.}
  \item{pl.iter}{only if pl==TRUE: the number of iterations needed for each confidence limit.}
  \item{betahist}{only if pl==TRUE: the complete history of beta estimates for each confidence limit.}
  \item{pl.conv}{only if pl==TRUE: the convergence status (deviation of log likelihood from target value, last maximum change in beta)
                 for each confidence limit.}
  If \code{dataout=TRUE}, additionally:
  \item{data}{a copy of the input data set}
  \item{weights}{the weights variable (if applicable)}                 
}
\references{
Firth D (1993). Bias reduction of maximum likelihood estimates. \emph{Biometrika} 
  80, 27--38.

Heinze G, Schemper M (2002). A solution to the problem of 
  separation in logistic regression. \emph{Statistics in Medicine} 21: 2409-2419.

Heinze G, Ploner M (2003). Fixing the nonconvergence bug in 
logistic regression with SPLUS and SAS. \emph{Computer Methods and 
Programs in Biomedicine} 71: 181-187.

Heinze G, Ploner M (2004). Technical Report 2/2004: A SAS-macro, S-PLUS library and
  R package to perform logistic regression without convergence problems.
  Section of Clinical Biometrics, Department of
  Medical Computer Sciences, Medical University of Vienna, Vienna, Austria.
  \url{http://www.meduniwien.ac.at/user/georg.heinze/techreps/tr2_2004.pdf}
  
Heinze G (2006). A comparative investigation of methods for logistic regression
with separated or nearly separated data. \emph{Statistics in Medicine} 25: 4216-4226.
 

Venzon DJ, Moolgavkar AH (1988). A method for computing profile-likelihood
  based confidence intervals. \emph{Applied Statistics} 37:87-94.
}
\author{
Georg Heinze and Meinhard Ploner
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{drop1.logistf}}
\code{\link{add1.logistf}}
\code{\link{anova.logistf}}
}
\examples{
data(sex2)
fit<-logistf(case ~ age+oc+vic+vicl+vis+dia, data=sex2)
summary(fit)
nobs(fit)
drop1(fit)
plot(profile(fit,variable="dia"))

extractAIC(fit)

fit1<-update(fit, case ~ age+oc+vic+vicl+vis)
extractAIC(fit1)
anova(fit,fit1)


data(sexagg)
fit2<-logistf(case ~ age+oc+vic+vicl+vis+dia, data=sexagg, weights=COUNT)
summary(fit2)


# simulated SNP example
# not run
set.seed(72341)
snpdata<-rbind(
    matrix(rbinom(2000,2,runif(2000)*0.3),100,20),
    matrix(rbinom(2000,2,runif(2000)*0.5),100,20))
colnames(snpdata)<-paste("SNP",1:20,"_",sep="")
snpdata<-as.data.frame(snpdata)
for(i in 1:20) snpdata[,i]<-as.factor(snpdata[,i])
snpdata$case<-c(rep(0,100),rep(1,100))


fitsnp<-logistf(data=snpdata, formula=case~1, pl=FALSE)
add1(fitsnp)
fitf<-forward(fitsnp)
fitf

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models}
\keyword{ regression }% __ONLY ONE__ keyword per line
