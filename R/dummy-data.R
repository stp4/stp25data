#' DF dummy data
#'
#' @description Antikörper SARS-Cov2-Impfung
#'
#' @format A data frame with 441 rows and 34 variables:
#' \describe{
#'  \item{patid}{Study patid}
#'  \item{alter}{Alter}
#'  \item{grunderkrankung }{Grunderkrankungen}
#' }
#' @docType data
#' @keywords datasets
#' @name DFdummy
#' @examples
#' 
#' 
#' 
#' data("DFdummy")
#' #' DF1 <- DFdummy %>% filter2(study.agreement)
#' attr(DF1, "filter")
#' DF2 <- DF1 %>% filter2(
#'   st.p.sars.cov2 == "nein",
#'   !is.na(spike.igg.3.impfung),
#'   !is.na(MPN)
#'   
#' )
#' 
#' DF3 <- DF2 %>% filter2(
#'   study.agreement,
#'   sero.negativ.after.dose.2,
#'   !is.na(spike.igg.3.impfung),
#'   !is.na(spike.igg.4.impfung),
#'   spike.igg.3.impfung == "<7.1 BAU/ml"
#' )
#' dat <- prepare_consort(DF1, DF2, DF3)
#' 
#' require(consort_plot )
#' out <- consort_plot(
#'   data = dat,
#'   orders = c(
#'     Trial.Nr   = "Population",
#'     Condition.1           = "Excluded",
#'     Trial.Nr     = "Allocated",
#'     Condition.2    = "Lost of Follow-up",  
#'     Trial.Nr = "Finished Followup",
#'     Condition.3    = "Not evaluable for the final analysis",  
#'     Trial.Nr = "Final Analysis"
#'   ),
#'   side_box = c("Condition.1", "Condition.2", "Condition.3"),
#'   cex = 0.9
#' )
#' 
#' 
#' 
#' 
#' plot(out)
"DFdummy"


# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# get_dummy_data <- function(){
# require(tidyverse)
# library(stp25tools)
# require(stp25stat2)
# require(stp25output2)
# 
# load(
#   "C:/Users/wpete/Dropbox/1_Projekte/838_Julia_Berger/Processed data/JuliaBerger.Rdata"
# )
# 
# 
# new_levels<- function(x, levels) {
#   levels(x) <- levels
#   x
# }
# 
#  lvs <- c("--", "-", "o", "+", "++")
# 
# 
# 
# n <-  nrow(DF)
# 
# DF <- DF %>%
#   mutate(
#     spike.3.positiv = spike.igg.3.impfung == "positiv",
#     spike.igg.3.impfung = new_levels( spike.igg.3.impfung, c(">7.1 BAU/ml", "<7.1 BAU/ml")),
#     spike.3 = spike.igg.3.impfung,
#     sero.after.dose.2 = spike.igg.pos.neg,
#     sero.negativ.after.dose.2  =  sero.after.dose.2 == levels(sero.after.dose.2)[2],
# 
#     MMF = factor(MMF , rev(levels(MMF))),
#     Tac = factor(Tac , rev(levels(Tac))),
#     MPN = factor(MPN , rev(levels(MPN))),
#     ntx.vintage =  ntx.vintage / 12,
# 
#     Gesundheit = gl(length(lvs), 1, n, lvs),
#     Sport =     gl(length(lvs), 2, n, lvs),
#     Freizeit = gl(length(lvs), 3, n, lvs),
#     Essen =    gl(length(lvs), 5, n, lvs),
#     alter = round(alter),
# 
#     study.agreement= TRUE
# 
# 
#   ) %>% select(
#     patid,
#     geschlecht,
#     alter,
#     gewicht,
#     bmi,
#     grunderkrankung,
#     spendertyp,
#     ntx.vintage,
#     zahlntx,
# 
#     Gesundheit,
#     Sport,
#     Freizeit,
#     Essen,
#     haemoglobin,
#     leukozyten,
#     albumin,
#     herzinsuffizienz,
#     khk,
#     pavk,
#     cavk,
#     diabetes,
#     hba1c,
#     x1.impfstoff,
#     x3.impfstoff,
# 
#     Tac,
#     MPA,
#     MMF,
#     MMF,
#     MPN,
# 
#     sero.negativ.after.dose.2,
#     spike.3.positiv,
#     spike.igg.3.impfung,
#     spike.igg.4.impfung,
#     st.p.sars.cov2,
#     study.agreement
#   )
# 
# 
# DF_in <- DF[ seq_len( 441 - n  ), ] %>%
#   mutate( study.agreement = FALSE,
#           patid = patid+1000,
#           geschlecht  = sample(geschlecht),
#           alter = sample(alter))
# 
# 
# 
# DFdummy <-  rbind(DF, DF_in)
# 
# 
# 
# save(DFdummy, file ="data/DFdummy.Rdata")
# 
# 
# 
# 
# 
# 
# 
# # Analyse -----------------------------------------------------------------
# 
# DF %>% Tbll_desc(
#   geschlecht,
#   alter[median, 0],
#   gewicht,
#   bmi,
#   grunderkrankung,
#   spendertyp,
#   ntx.vintage[median, 0],
#   zahlntx[median, 0],
#   spike.igg.3.impfung,
#   include.total = TRUE
# )     %>%  Output("Demografische Merkmale der Teilnehmer aufgeteilt in Spike IgG 3.Impfung")
# 
# 
# }