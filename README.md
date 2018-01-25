
<!-- README.md is generated from README.Rmd. Please edit that file -->
stp25data
=========

Daten für die in den Dokumentationen verwendeten Beispiele. Dabei handelt es sich um veränderte Beispieldaten aus dem SPSS-Buch von Bühl.

Overview
--------

-   **hyper** Hypertonie Studie Korrelationen Buehl Seite 323
-   **kirche** Kirchlichkeits Studie Korrelationen Bühl Seite 327
-   **varana** Merkfaehigkeitstest Varianzanalyse Bühl Seite 237
-   **hkarz** Harnblasenkarzinom Logistische Regression Buehl Seite 354
-   **fkv** Freiburger Fragebogen zur Krankheitsverarbeitung PCA oder Faktoranalyse Buehl Seite 473
-   **weitere Daten** discrim, manova, test
-   **poisson\_sim** Poisso Regression <http://www.ats.ucla.edu/stat/spss/dae/poissonreg.htm>
-   **MMvideo** A video game example Mixed-Modelshttp://www.stat.cmu.edu/~hseltman/309/Book/chapter15.pdf
-   **schools** Mixed-Models <http://www.stat.cmu.edu/~hseltman/309/Book/chapter15.pdf>

### Usage

``` r
# devtools::install_github("stp4/stp25data")

 library(stp25vers)
 
 APA2(alter ~ geschl, varana)
#> 
#> 
#> Table: geschl 
#> 
#> Item    Characteristics   N    männlich (n=15)   weiblich (n=12) 
#> ------  ----------------  ---  ----------------  ----------------
#> alter   bis 30 Jahre      27   27% (4)           25% (3)         
#>         31-50 Jahre            33% (5)           33% (4)         
#>         über 50 Jahre          40% (6)           42% (5)
```

### Literatur

Bühl, Zöfel, SPSS Version 12: Einführung in die moderne Datenanalyse unter Windows, Pearson Studium, 2005
