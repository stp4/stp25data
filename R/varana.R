#' varana Merkfaehigkeitstest
#'
#' Varianzanalyse  Bühl Seite 237
#' @format Ein data.frame mit 27 rows und 6 Variablen:
#' \itemize{
#'   \item  nr:
#'   \item  geschl:
#'   \item  alter
#'   \item  m1:
#'   \item  m1:
#'   \item  m2:
#'   \item  m3:
#'   \item  m4:
#' }
#' @docType data
#' @keywords datasets
#' @name varana
#' @usage data(varana)
#' @examples
#' library(stp25vers)
#' library(tidyverse)
#' library(lmerTest)
#' library(modelr)
#' APA2(alter~ geschl , varana)
#' varana %>% berechne(m1, m2, m3, m4, by =  ~ geschl) %>%
#'   fix_format() %>% (function(x) x[, c(1:7,9)])
#'
#'
#' renameLevels<- function(data,
#'                         labels=c("Begin", "2 Monate", "6 Monate", "12 Monate"),
#'                         var= "variable"){
#'   levels( data[,var])<- labels
#'   data
#' }
#'
#'
#' pd <- position_dodge(0.15)
#'
#' varana %>% berechne(m1, m2, m3, m4, by =  ~ geschl) %>%
#'   renameLevels %>%
#'   ggplot(aes(variable, mean, group = geschl,
#'              colour = geschl,
#'              shape= geschl)) +
#'   geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd),
#'                 width = .1,
#'                 position = pd) +
#'   geom_line(position = pd) +
#'   geom_point(position = pd, size = 3) +
#'   xlab("") +
#'   ylab("Merkfaehigkeitstest")
#' #+  coord_cartesian(ylim=c(1, 25)) + scale_y_reverse(breaks=1:6)
#'
#'
#'
#'
#'
#' pd<-position_dodge(.5)
#' varana %>%  melt2(m1, m2, m3, m4, by =  ~ geschl) %>%
#'   renameLevels %>%
#'   ggplot(aes(variable,
#'              value,
#'              fill=geschl)) +
#'   stat_boxplot(geom ='errorbar', width=0.4, position=pd) +
#'   geom_boxplot(width=0.4, position=pd) +
#'   xlab("") +
#'   ylab("Merkfaehigkeitstest")
#' GetLabelOrName(varana)
#' varana2 <- varana %>%
#'   gather( Zeit, Merkfgk, m1:m4 ) %>%
#'   mutate(Zeit=factor( Zeit, Cs(m1, m2, m3 ,m4), Cs(t0, t1, t2, t3))) %>%
#'   Label(Merkfgk="Merkfaehigkeit")
#'
#' Tabelle( Merkfgk ~ Zeit, varana2)
#'
#' disp_fits <- varana2 %>%
#'   fit_with(lmer,
#'            formulas(~Merkfgk,
#'                     basline = ~ Zeit  +(1 | nr),
#'                     additive = ~ geschl + alter  + (1 | nr),
#'                     interaction = ~ geschl *  alter * Zeit  + (1 | nr) ))
#'
#' disp_fits
#' #+ (1|Zeit)
#' APA_Table(disp_fits, type="anova")
#' library(effects)
#'
#' fit<- lmer(Merkfgk~ geschl *  alter * Zeit  + (1 | nr) , varana2 )
#' allEffects(fit) %>% Ordnen()
#' #' #library(car)
#' #leveneTest( Merkfgk~   Zeit   , DF, center= mean)
NULL
