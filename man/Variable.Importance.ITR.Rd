% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Variable.Importance.ITR.R
\name{Variable.Importance.ITR}
\alias{Variable.Importance.ITR}
\title{Calcuates variable importance measures for a random forest object.}
\usage{
Variable.Importance.ITR(RF.fit, n0 = 5, N0 = 20, sort = TRUE,
  details = FALSE, truncate.zeros = TRUE, depth = 1, AIPWE = FALSE)
}
\arguments{
\item{RF.fit}{forest object from Build.RF.ITR. Required input.}

\item{n0}{minimum number of treatment/control observations needed in a split to call a node terminal. Defaults to 2.}

\item{N0}{minimum number of observations needed in a split to call a node terminal. Defaults to 20.}

\item{sort}{sort the variable importance measure? Defaults to TRUE.}

\item{details}{print details of each tree as the function progresses. Defaults to FALSE.}

\item{truncate.zeros}{sets variable importances less than 0 to 0. Defaults to TRUE.}

\item{depth}{internal variable.}

\item{AIPWE}{indicator for AIPWE estimation.}
}
\value{
Returns ordered variable importance measure calculated for each splitting variable.
}
\description{
This function accepts a forest object from the `Build.RF.ITR` function and estimates the importance of each
predictor. This is accomplished by considering each tree in the forest, obtaining the out-of-bag value for each predictor in that tree, 
obtaining the permuted out-of-bag value for each predictor in the tree, and comparing the values. A larger discrepancy between 
the original value and permuted value indicates the predictor is more important in predicting treatment. The function
returns the variables in order of importance along with the importance measure, scaled to be out of 1.
}
\examples{
set.seed(1)
dat <- gdataM(n = 1000, depth = 2, beta1 = 3, beta2 = 1)
# Build a forest with 100 trees
forest <- Build.RF.ITR(dat, col.y="y", col.trt="trt", col.prtx="prtx", split.var=1:4, ntree=100)
# Calculate variable importance measures (X1 and X3 should be returned as the most important)
 Variable.Importance.ITR(forest)
# X1          X3          X4          X2 
# 0.727854671 0.260080262 0.009528276 0.002536791 
}
