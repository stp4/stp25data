#' poisson_sim
#'
#' http://www.ats.ucla.edu/stat/spss/dae/poissonreg.htm
#' In this example, num_awards is the outcome variable and indicates
#' the number of awards earned by students at a high school in a year,
#' math is a continuous predictor variable and represents students'
#' scores on their math final exam, and prog is a categorical predictor
#' variable with three levels indicating the type of
#' program in which the students were enrolled.
#' @format Ein data.frame mit 200 rows und 4 Variablen:
#' \itemize{
#'  \item  id: ID
#'   \item  num_awards: Anzahl
#'   \item  prog: Program
#'   \item  math: Anzahl
#' }
#' @docType data
#' @keywords datasets
#' @name poisson_sim
#' @usage data(poisson_sim)
#' @examples
#'
#'  library(broom)
#'  library(car)
#' #head(poisson_sim)
#' #names(poisson_sim)
#' #-- SPSS kodiert die Gruppe 3 als Referenz
#' poisson_sim$prog <-
#'   factor(poisson_sim$prog, c("vocation", "general",  "academic"))
#'   fit1 <- glm(num_awards ~ prog + math, poisson_sim, family = poisson())
#'
#'
#' Goodness <- function(x, ..) {
#'   glance(x)[, c(6, 7, 3, 4, 5)]
#' }
#' fit1 %>% Goodness
#'
#' #--Omnibus Test
#'  lmtest::lrtest(fit1)
#'
#' #-- Wald Chi-Square
#'  Anova(fit1)
#'  APA_Table(fit1)
#'
#' cbind (tidy(fit1), confint(fit1)) %>% fix_format()
#' x <- cbind(tidy(fit1)[1:2], confint(fit1))
#' x[2:3] <- exp(x[2:3])
#' x %>% fix_format()
#'
#' "The output above indicates that the incident rate for [prog=academic] is 2.042
#' times the incident rate for the reference group, [prog=vocation].
#' Likewise, the incident rate for [prog=general] is 0.691 times the incident rate
#' for the reference group holding the other variables at constant.
#' The percent change in the incident rate of num_awards is an
#' increase of 7% for every unit increase in math."
#' R2(fit1)
#' RMSE(fit1)
NULL
