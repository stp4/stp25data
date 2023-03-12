#' hkarz Harnblasenkarzinom
#'
#' Logistische Regression Buehl Seite 354
#' sowie Magenkarzinom
#' @format Ein data.frame mit 45 rows und 3 Variablen:
#' \itemize{
#'   \item  gruppe: Krank/Gesund
#'   \item  tzell: T-Zelltypisierung
#'   \item  lai: LAI-Test
#' }
#' @docType data
#' @keywords datasets
#' @name hkarz
#' @usage data(hkarz)
#' @examples
#' 
#' library(broom)
#' fit2<- glm(gruppe~tzell, hkarz, family = binomial)
#' APA_Table(fit2)
#' lmtest::lrtest(fit2) %>%
#'   tidy %>% fix_format()
#' r2<- R2(fit2)
#' #-- R2 wie SPSS
#' round(c( '-2 Log-Likeliehood' = anova(fit2)[2, "Resid. Dev" ],
#'          'Cox & Snell R2'= r2$r2ML,
#'          'Nagelkerke R2' =r2$r2CU),2)
#'
#' fit2 %>% tidy %>% transform(exp= round(exp(estimate),2)) %>% fix_format()
#'
#' Klassifikation(fit2)
#'
#'
#' fit3<- glm(gruppe~tzell+lai, hkarz, family = binomial)
#' APA_Table(fit3)
#' lmtest::lrtest(fit3) %>%
#'   tidy %>% fix_format()
#' r2<- R2(fit3)
#' #-- R2 wie SPSS
#' round(c( '-2 Log-Likeliehood' = min(anova(fit3)[ , "Resid. Dev" ]),
#'          'Cox & Snell R2'= r2$r2ML,
#'          'Nagelkerke R2' =r2$r2CU),2)
#'
#' fit3 %>% tidy %>% transform(exp= round(exp(estimate),2)) %>% fix_format()
#'
#' Klassifikation(fit3)
#'
#' ### Magenkarzinom ###
#' mkarz <- GetData("C:/Users/wpete/Dropbox/3_Forschung/1 Statistik/BspDaten/SPSS/_Bühl/MKARZ.SAV")
#' # Text("Buehl Seite 553", style=3)
#' #Text("Die Datei mkarz.sav ist ein Datensatz mit 106 Patientan
#' #     mit Magenkarzinom über einen Zeitraum von 5 Jahren")
#'
#' mkarz %>% Tabelle2(survive="median", status, lkb)
#' mkarz$status<- ifelse(mkarz$status=="tot", 1, 0)
#'
#' #Head("Kaplan-Meier estimator without grouping", style=3)
#' #Text("
#' #     m0 <- Surv(survive, status) ~ 1
#' #     res0<- survfit(m0, mkarz)
#' #
#' #     ")
#' m0 <- Surv(survive, status) ~ 1
#' res0<- survfit(m0, mkarz)
#' APA2(res0)
#' #windows(8,4)
#' #par(mfrow=c(1,2))
#' #plot( res0 , ylab="Hazard", mark.time = T)
#' #plot( res0, fun="cumhaz",  ylab="Cumulative Hazard" )
#' #SaveData(caption="plot: mkarz")
#'
#'
#'
#'
#'   m1 <- Surv(survive, status) ~ lkb
#' res1<- survfit(m1, mkarz)
#' fit1<- coxph(m1, mkarz)
#' logrank1<- survdiff(m1, mkarz)
#'  model_info(logrank1)
#' APA2(res1, caption="Kaplan-Meier")
#' APA2(logrank1)
#' APA2(coxph(m1,mkarz))
NULL
