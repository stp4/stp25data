#' kirche  Kirchlichkeits Studie
#'
#' Korrelationen Bühl Seite 327
#' @format Ein data.frame mit 35 rows und 3 Variablen:
#' \itemize{
#'   \item  alter:
#'   \item  kirche:
#'   \item  gast:
#' }
#' @docType data
#' @keywords datasets
#' @name kirche
#' @usage data(kirche)
#' @examples
#' library(stp25)
#' head(kirche)
#' ##-- Partial-Korrelation Bühl Seite 327
#' APA_Correlation(~alter+kirche+gast, kirche, test=TRUE)
#' #kirche<- dapply2(kirche, scale)
#' fit<-summary(lm(kirche~alter+gast, kirche) )
#' p<- coefficients( fit)[3,4]
#'
#' ki_al<- residuals(lm(kirche~alter, kirche))
#' ga_al<- residuals(lm(gast~alter, kirche))
#' round(c(r=cor(ki_al, ga_al),  df=fit$df[2],  p.value= p), 3)
#'
NULL
