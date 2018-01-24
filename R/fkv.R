#' fkv Freiburger Fragebogen zur Krankheitsverarbeitung
#'
#' PCA oder Faktoranalyse Buehl Seite 473
#' @format Ein data.frame mit 160 Faellen und 35 Items:
#' @docType data
#' @keywords datasets
#' @name fkv
#' @usage data(fkv)
#' @examples
#' #library(stp25)
#'
#' head(fkv)
#' APA2( ~., fkv, test=TRUE)
#' library(arm)
#' windows(5,5)
#' corrplot(fkv, abs=TRUE, n.col.legend=7)#  corrplot {arm}
#' SaveData( )
#' Principal2(fkv, 5, cut=.35)
#'
#' library(lavaan)
#' library(semPlot)
#'
#'
#' Model<-'
#' Verarbeitung =~ F5+F16+F22+F9+F26+F6+F35+F33+F12+F34+F4
#' Coping =~ F7+F8+F17+F14+F15+F18+F19+F1+F13+F20
#' Vertrauen =~ F28+F27+F31+F29
#' Religion =~F21+F25+F30+F23+F24
#' Distanz =~F3+F2+F10+F11
#'
#' '
#' fit.Lavaan <- sem( Model, data=fkv)
#' APA2(fit.Lavaan)
#' # parameterEstimates(fit.Lavaan)
#' # Est <- parameterEstimates(fit.Lavaan, ci = FALSE, standardized = TRUE)
#' # #fitMeasures(fit.Lavaan, c("chisq", "df", "pvalue", "cfi", "rmsea"))
#' # #round( inspect(fit.Lavaan,"r2")  ,2)
#' # #parTable(fit.Lavaan)
#' # #show(fit.Lavaan)
#' # anova(fit.Lavaan)
#'
#' semPaths(fit.Lavaan, "std", rotation=2, title = FALSE)
#' title("Std", line = 3)
#'
#' #'
#' #Reliability(fkv[1:4])
#'
#' Reliability2(~F3+F2+F10+F11, fkv, check.keys =TRUE)
#' res<- Reliability(~F3+F2+F10+F11, fkv, check.keys =TRUE)
#' res$index
#' names(res)
#' res %>% Output
#' res %>% Alpha() %>% Output()
#'
#' Verarbeitung <- Reliability(~ F5+F16+F22+F9+F26+F6+F35+F33+F12+F34+F4, fkv, check.keys =TRUE)
#' Coping <- Reliability(~ F7+F8+F17+F14+F15+F18+F19+F1+F13+F20, fkv, check.keys =TRUE)
#' Vertrauen <- Reliability(~ F28+F27+F31+F29, fkv, check.keys =TRUE)
#' Religion <- Reliability(~F21+F25+F30+F23+F24, fkv, check.keys =TRUE)
#' Distanz <- Reliability(~F3+F2+F10+F11, fkv, check.keys =TRUE)
#'
#'
#' Alpha(Verarbeitung, Coping, Vertrauen, Religion, Distanz) %>% Output()
NULL
