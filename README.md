# Purpose

Setup of GitHub to check code and graphs

``` r
rm(list = ls()) # Clean your environment:
gc() # garbage collection - It can be useful to call gc after a large object has been removed, as this may prompt R to return memory to the operating system.
```

    ##          used (Mb) gc trigger (Mb) max used (Mb)
    ## Ncells 468533 25.1    1008472 53.9   660385 35.3
    ## Vcells 864864  6.6    8388608 64.0  1770182 13.6

``` r
library(tidyverse)
```

    ## Warning: package 'ggplot2' was built under R version 4.3.3

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
list.files('code/', full.names = T, recursive = T) %>% .[grepl('.R', .)] %>% as.list() %>% walk(~source(.))
```

    ## Warning: package 'broom' was built under R version 4.3.3

    ## 
    ## Please cite as: 
    ## 
    ##  Hlavac, Marek (2022). stargazer: Well-Formatted Regression and Summary Statistics Tables.
    ##  R package version 5.2.3. https://CRAN.R-project.org/package=stargazer

    ## Warning: package 'plm' was built under R version 4.3.3

    ## 
    ## Attaching package: 'plm'
    ## 
    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     between, lag, lead

Regression table for the pooled OLS of the dataset

``` r
Pool <- Pooled_OLS()
```

    ## Rows: 12810 Columns: 52
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (8): countrycode, country, currency_unit, i_cig, i_xm, i_xr, i_outlier,...
    ## dbl (44): year, rgdpe, rgdpo, pop, emp, avh, hc, ccon, cda, cgdpe, cgdpo, cn...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    ## 
    ## % Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy Institute. E-mail: marek.hlavac at gmail.com
    ## % Date and time: Thu, Aug 29, 2024 - 19:04:06
    ## \begin{table}[!htbp] \centering 
    ##   \caption{} 
    ##   \label{} 
    ## \begin{tabular}{@{\extracolsep{5pt}}lc} 
    ## \\[-1.8ex]\hline 
    ## \hline \\[-1.8ex] 
    ##  & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
    ## \cline{2-2} 
    ## \\[-1.8ex] & ln\_Gdp\_pc \\ 
    ## \hline \\[-1.8ex] 
    ##  l\_pop & $-$0.510$^{***}$ \\ 
    ##   & (0.009) \\ 
    ##   & \\ 
    ##  hc & 0.335$^{***}$ \\ 
    ##   & (0.013) \\ 
    ##   & \\ 
    ##  l\_cn & 0.515$^{***}$ \\ 
    ##   & (0.009) \\ 
    ##   & \\ 
    ##  ctfp & 1.135$^{***}$ \\ 
    ##   & (0.026) \\ 
    ##   & \\ 
    ##  Constant & 2.204$^{***}$ \\ 
    ##   & (0.067) \\ 
    ##   & \\ 
    ## \hline \\[-1.8ex] 
    ## Observations & 1,842 \\ 
    ## R$^{2}$ & 0.967 \\ 
    ## Adjusted R$^{2}$ & 0.967 \\ 
    ## F Statistic & 13,557.430$^{***}$ (df = 4; 1837) \\ 
    ## \hline 
    ## \hline \\[-1.8ex] 
    ## \textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
    ## \end{tabular} 
    ## \end{table} 
    ## 
    ## % Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy Institute. E-mail: marek.hlavac at gmail.com
    ## % Date and time: Thu, Aug 29, 2024 - 19:04:06
    ## \begin{table}[!htbp] \centering 
    ##   \caption{} 
    ##   \label{} 
    ## \begin{tabular}{@{\extracolsep{5pt}} c} 
    ## \\[-1.8ex]\hline 
    ## \hline \\[-1.8ex] 
    ## html \\ 
    ## \hline \\[-1.8ex] 
    ## \end{tabular} 
    ## \end{table}

``` r
Pool
```

    ##  [1] ""                                                                                                                
    ##  [2] "% Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy Institute. E-mail: marek.hlavac at gmail.com"
    ##  [3] "% Date and time: Thu, Aug 29, 2024 - 19:04:06"                                                                   
    ##  [4] "\\begin{table}[!htbp] \\centering "                                                                              
    ##  [5] "  \\caption{} "                                                                                                  
    ##  [6] "  \\label{} "                                                                                                    
    ##  [7] "\\begin{tabular}{@{\\extracolsep{5pt}}lc} "                                                                      
    ##  [8] "\\\\[-1.8ex]\\hline "                                                                                            
    ##  [9] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [10] " & \\multicolumn{1}{c}{\\textit{Dependent variable:}} \\\\ "                                                     
    ## [11] "\\cline{2-2} "                                                                                                   
    ## [12] "\\\\[-1.8ex] & ln\\_Gdp\\_pc \\\\ "                                                                              
    ## [13] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [14] " l\\_pop & $-$0.510$^{***}$ \\\\ "                                                                               
    ## [15] "  & (0.009) \\\\ "                                                                                               
    ## [16] "  & \\\\ "                                                                                                       
    ## [17] " hc & 0.335$^{***}$ \\\\ "                                                                                       
    ## [18] "  & (0.013) \\\\ "                                                                                               
    ## [19] "  & \\\\ "                                                                                                       
    ## [20] " l\\_cn & 0.515$^{***}$ \\\\ "                                                                                   
    ## [21] "  & (0.009) \\\\ "                                                                                               
    ## [22] "  & \\\\ "                                                                                                       
    ## [23] " ctfp & 1.135$^{***}$ \\\\ "                                                                                     
    ## [24] "  & (0.026) \\\\ "                                                                                               
    ## [25] "  & \\\\ "                                                                                                       
    ## [26] " Constant & 2.204$^{***}$ \\\\ "                                                                                 
    ## [27] "  & (0.067) \\\\ "                                                                                               
    ## [28] "  & \\\\ "                                                                                                       
    ## [29] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [30] "Observations & 1,842 \\\\ "                                                                                      
    ## [31] "R$^{2}$ & 0.967 \\\\ "                                                                                           
    ## [32] "Adjusted R$^{2}$ & 0.967 \\\\ "                                                                                  
    ## [33] "F Statistic & 13,557.430$^{***}$ (df = 4; 1837) \\\\ "                                                           
    ## [34] "\\hline "                                                                                                        
    ## [35] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [36] "\\textit{Note:}  & \\multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\\\ "                  
    ## [37] "\\end{tabular} "                                                                                                 
    ## [38] "\\end{table} "                                                                                                   
    ## [39] ""                                                                                                                
    ## [40] "% Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy Institute. E-mail: marek.hlavac at gmail.com"
    ## [41] "% Date and time: Thu, Aug 29, 2024 - 19:04:06"                                                                   
    ## [42] "\\begin{table}[!htbp] \\centering "                                                                              
    ## [43] "  \\caption{} "                                                                                                  
    ## [44] "  \\label{} "                                                                                                    
    ## [45] "\\begin{tabular}{@{\\extracolsep{5pt}} c} "                                                                      
    ## [46] "\\\\[-1.8ex]\\hline "                                                                                            
    ## [47] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [48] "html \\\\ "                                                                                                      
    ## [49] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [50] "\\end{tabular} "                                                                                                 
    ## [51] "\\end{table} "

Regression table for a two way fixed effects model

``` r
Two_Way <- Two_Way_Fix_Eff()
```

    ## Rows: 12810 Columns: 52
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (8): countrycode, country, currency_unit, i_cig, i_xm, i_xr, i_outlier,...
    ## dbl (44): year, rgdpe, rgdpo, pop, emp, avh, hc, ccon, cda, cgdpe, cgdpo, cn...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    ## 
    ## % Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy Institute. E-mail: marek.hlavac at gmail.com
    ## % Date and time: Thu, Aug 29, 2024 - 19:04:07
    ## \begin{table}[!htbp] \centering 
    ##   \caption{} 
    ##   \label{} 
    ## \begin{tabular}{@{\extracolsep{5pt}}lc} 
    ## \\[-1.8ex]\hline 
    ## \hline \\[-1.8ex] 
    ##  & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ 
    ## \cline{2-2} 
    ## \\[-1.8ex] & ln\_Gdp\_pc \\ 
    ## \hline \\[-1.8ex] 
    ##  l\_pop & $-$0.436$^{***}$ \\ 
    ##   & (0.024) \\ 
    ##   & \\ 
    ##  hc & 0.065$^{*}$ \\ 
    ##   & (0.033) \\ 
    ##   & \\ 
    ##  l\_cn & 0.632$^{***}$ \\ 
    ##   & (0.010) \\ 
    ##   & \\ 
    ##  ctfp & 1.314$^{***}$ \\ 
    ##   & (0.032) \\ 
    ##   & \\ 
    ## \hline \\[-1.8ex] 
    ## Observations & 1,842 \\ 
    ## R$^{2}$ & 0.819 \\ 
    ## Adjusted R$^{2}$ & 0.809 \\ 
    ## F Statistic & 1,975.083$^{***}$ (df = 4; 1745) \\ 
    ## \hline 
    ## \hline \\[-1.8ex] 
    ## \textit{Note:}  & \multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
    ## \end{tabular} 
    ## \end{table} 
    ## 
    ## % Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy Institute. E-mail: marek.hlavac at gmail.com
    ## % Date and time: Thu, Aug 29, 2024 - 19:04:07
    ## \begin{table}[!htbp] \centering 
    ##   \caption{} 
    ##   \label{} 
    ## \begin{tabular}{@{\extracolsep{5pt}} c} 
    ## \\[-1.8ex]\hline 
    ## \hline \\[-1.8ex] 
    ## html \\ 
    ## \hline \\[-1.8ex] 
    ## \end{tabular} 
    ## \end{table}

``` r
Two_Way
```

    ##  [1] ""                                                                                                                
    ##  [2] "% Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy Institute. E-mail: marek.hlavac at gmail.com"
    ##  [3] "% Date and time: Thu, Aug 29, 2024 - 19:04:07"                                                                   
    ##  [4] "\\begin{table}[!htbp] \\centering "                                                                              
    ##  [5] "  \\caption{} "                                                                                                  
    ##  [6] "  \\label{} "                                                                                                    
    ##  [7] "\\begin{tabular}{@{\\extracolsep{5pt}}lc} "                                                                      
    ##  [8] "\\\\[-1.8ex]\\hline "                                                                                            
    ##  [9] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [10] " & \\multicolumn{1}{c}{\\textit{Dependent variable:}} \\\\ "                                                     
    ## [11] "\\cline{2-2} "                                                                                                   
    ## [12] "\\\\[-1.8ex] & ln\\_Gdp\\_pc \\\\ "                                                                              
    ## [13] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [14] " l\\_pop & $-$0.436$^{***}$ \\\\ "                                                                               
    ## [15] "  & (0.024) \\\\ "                                                                                               
    ## [16] "  & \\\\ "                                                                                                       
    ## [17] " hc & 0.065$^{*}$ \\\\ "                                                                                         
    ## [18] "  & (0.033) \\\\ "                                                                                               
    ## [19] "  & \\\\ "                                                                                                       
    ## [20] " l\\_cn & 0.632$^{***}$ \\\\ "                                                                                   
    ## [21] "  & (0.010) \\\\ "                                                                                               
    ## [22] "  & \\\\ "                                                                                                       
    ## [23] " ctfp & 1.314$^{***}$ \\\\ "                                                                                     
    ## [24] "  & (0.032) \\\\ "                                                                                               
    ## [25] "  & \\\\ "                                                                                                       
    ## [26] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [27] "Observations & 1,842 \\\\ "                                                                                      
    ## [28] "R$^{2}$ & 0.819 \\\\ "                                                                                           
    ## [29] "Adjusted R$^{2}$ & 0.809 \\\\ "                                                                                  
    ## [30] "F Statistic & 1,975.083$^{***}$ (df = 4; 1745) \\\\ "                                                            
    ## [31] "\\hline "                                                                                                        
    ## [32] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [33] "\\textit{Note:}  & \\multicolumn{1}{r}{$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\\\ "                  
    ## [34] "\\end{tabular} "                                                                                                 
    ## [35] "\\end{table} "                                                                                                   
    ## [36] ""                                                                                                                
    ## [37] "% Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy Institute. E-mail: marek.hlavac at gmail.com"
    ## [38] "% Date and time: Thu, Aug 29, 2024 - 19:04:07"                                                                   
    ## [39] "\\begin{table}[!htbp] \\centering "                                                                              
    ## [40] "  \\caption{} "                                                                                                  
    ## [41] "  \\label{} "                                                                                                    
    ## [42] "\\begin{tabular}{@{\\extracolsep{5pt}} c} "                                                                      
    ## [43] "\\\\[-1.8ex]\\hline "                                                                                            
    ## [44] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [45] "html \\\\ "                                                                                                      
    ## [46] "\\hline \\\\[-1.8ex] "                                                                                           
    ## [47] "\\end{tabular} "                                                                                                 
    ## [48] "\\end{table} "
