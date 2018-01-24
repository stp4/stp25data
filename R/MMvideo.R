#' MMvideo Mixed-Models
#'
#' http://www.stat.cmu.edu/~hseltman/309/Book/chapter15.pdf
#'  A video game example
#'  Consider a study of the learning effects of repeated plays of a video game where
#'  age is expected to have an effect. The data are in MMvideo.txt. The quantitative
#'  outcome is the score on the video game (in thousands of points). The explanatory
#'  variables are age group of the subject and “trial” which represents which time the
#'  subject played the game (1 to 5). The “id” variable identifies the subjects.
#'
#' \itemize{
#'  \item  id
#'   \item  agegrp
#'   \item  trial
#'   \item  score
#' }
#' @docType data
#' @keywords datasets
#' @name MMvideo
#' @usage data(MMvideo)
#' @format Ein data.frame mit 150 rows und 4 Variablen
#' @examples
#' library(stp25)
#' library(effects)
#' library(gridExtra)
#' #getwd()
#' # MMvideo<- read.table("C:/Users/wpete/Dropbox/3_Forschung/R-Project/stp25/extdata/MMvideo.txt",
#' #                     header=TRUE)
#' head(MMvideo)
#' #Projekt("html")
#' fit1<-lm(score ~ agegrp+trial, MMvideo)
#' fit2<-lmerTest::lmer(score ~ agegrp+trial + (1|id), MMvideo)
#' fit3<-lm(score ~ agegrp*trial, MMvideo)
#' fit4<-lmerTest::lmer(score ~ agegrp*trial + (1|id), MMvideo)
#' APA_Table(fit1, fit2, fit3, fit4, type="tex")
#'
#'
#'
#' #  windows(8,6)
#' #  p1 <- plot(effect("trial",fit2), multiline=TRUE)
#' #  p2 <- plot(effect("agegrp*trial",fit4), multiline=TRUE)
#'
#'   #grid.arrange(p1,p2,ncol=2)
#'
#' # library(coefplot)
#' # windows(4,3)
#' #  coefplot(fit3, intercept=F, xlab="b (SE)")
#'
#' #  windows(4,3)
#' #  multiplot(fit1, fit2, intercept=F, xlab="b (SE)")
NULL


