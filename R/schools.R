#' schools Mixed-Models
#'
#' http://www.stat.cmu.edu/~hseltman/309/Book/chapter15.pdf
#'  Classroom example
#'  The (fake) data in schools.txt represent a randomized experiment of two different
#'  reading methods which were randomly assigned to third or fifth grade classrooms,
#'  one per school, for 20 different schools. The experiment lasted 4 months. The
#'  outcome is the after minus before difference for a test of reading given to each
#'  student. The average sixth grade reading score for each school on a different
#'  statewide standardized test (stdTest) is used as an explanatory variable for each
#'  school (classroom).
#'
#'  There are main effects for
#'  stdTest, grade level, and treatment group. There is a random effect (intercept) to
#'  account for school to school differences that induces correlation among scores for
#'  students within a school. Model selection included checking for interactions among
#'  the fixed effects, and checking the necessity of including the random intercept. The
#'  only change suggested is to drop the treatment effect. It was elected to keep the
#'  non-significant treatment in the model to allow calculation of a confidence interval
#'  for its effect
#' @format Ein data.frame mit 490 rows und 6 Variablen:
#' \itemize{
#' \item  student
#' \item  score
#' \item  grade
#' \item  treatment
#' \item  stdTest
#' \item  classroom: Block
#' }
#' @docType data
#' @keywords datasets
#' @name schools
#' @usage data(schools)
#' @examples
#' library(stp25)
#' #schools<- read.table("file:///C:/Users/wpete/Dropbox/3_Forschung/R-Project/stp25/extdata/schools.txt",
#' #                    header=TRUE)
#' summary(schools)
#' fit<-lmerTest::lmer(score ~  grade +treatment  + stdTest + (1|classroom), schools)
#' APA_Table(fit)
#'
#'
NULL
