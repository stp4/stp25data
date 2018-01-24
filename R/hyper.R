#' hyper Hypertonie Studie
#'
#' HYPER.SAV Korrelationen Buehl Seite 323
#' @format Ein data.frame mit 174 rows und 23 Variablen:
#' \itemize{
#'   \item nr: Probanden-Nummer
#'   \item  med: Medikament
#'   \item  g: Geschlecht
#'   \item  a: Alter
#'   \item  gr: Körpergröße
#'   \item  gew: Körpergewicht
#'   \item  rrs0: syst. Blutdruck, Ausgangswert
#'   \item  rrs1: syst. Blutdruck, nach 1 Monat
#'   \item  rrs6: syst. Blutdruck, nach 2 Monat
#'   \item  rrs12: syst. Blutdruck, nach 12 Monaten
#'   \item  rrd0: diast. Blutdruck, Ausgangswert
#'   \item  rrd1: diast. Blutdruck, nach 1 Monat
#'   \item  rrd6: diast. Blutdruck, nach 6 Monaten
#'   \item  rrd12: diast. Blutdruck, nach 12 Monaten
#'   \item  chol0: Cholesterin, Ausgangswert
#'   \item  chol1: Cholesterin, nach 1 Monat
#'   \item  chol6: Cholesterin, nach 6 Monaten
#'   \item  chol12: Cholesterin, nach 12 Monaten
#'   \item  bz0: Blutzucker, Ausgangswert
#'   \item  bz1: Blutzucker, nach 1 Monat
#'   \item  bz6: Blutzucker, nach 6 Monaten
#'   \item  bz12: Blutzucker, nach 12 Monaten
#'   \item  ak: Altersklassen
#'
#'
#' }
#' @docType data
#' @keywords datasets
#' @name hyper
#' @usage data(hyper)
#' @examples
#' library(stp25)
#' head(hyper)
#' ##-- Korrelationen Buehl Seite 323
#' APA_Correlation(~chol0+chol1+chol6+chol12, hyper,
#' caption="Korrelation nach Pearson",
#' test=TRUE, p.value=TRUE, sig.star=FALSE)
#'
#' APA_Correlation(~chol0+chol1+chol6+chol12, hyper,
#'          caption="Rangkorrelation nach Spearman",
#'          test=TRUE,
#'          corr_test="spearman",cor_diagonale_up=FALSE)
#'
#' # Buel Manova
#' #fit0<-lm(rrs0 ~ ak, hyper)
#' fit1<-lm(cbind(rrs0,rrd0,chol0,bz0) ~ ak, hyper)
#' fit2<-aov(cbind(rrs0,rrd0,chol0,bz0) ~ ak, hyper)
#' #  library(effects)
#' # plot(allEffects(fit1), main="")
#' summary(fit1)
#' car::Anova(fit1)
#' #APA_Table(fit1)  ## Regressionsanalyse
#' summary(fit2)
#'
#' R2(fit1)
#'
NULL
