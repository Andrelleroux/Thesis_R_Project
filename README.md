# Purpose

Setup of GitHub to check code and graphs

``` r
rm(list = ls()) # Clean your environment:
gc() # garbage collection - It can be useful to call gc after a large object has been removed, as this may prompt R to return memory to the operating system.
library(tidyverse)
list.files('code/', full.names = T, recursive = T) %>% .[grepl('.R', .)] %>% as.list() %>% walk(~source(.))
```

Regression table for the pooled OLS of the dataset

``` r
Pool <- Pooled_OLS()
```

% Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy
Institute. E-mail: marek.hlavac at gmail.com % Date and time: Thu, Aug
29, 2024 - 19:13:49
% Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy
Institute. E-mail: marek.hlavac at gmail.com % Date and time: Thu, Aug
29, 2024 - 19:13:49
``` r
Pool
```

\[1\] “”  
\[2\] “% Table created by stargazer v.5.2.3 by Marek Hlavac, Social
Policy Institute. E-mail: marek.hlavac at gmail.com” \[3\] “% Date and
time: Thu, Aug 29, 2024 - 19:13:49”  
\[4\] “\begin{table}\[!htbp\] \centering”  
\[5\] ” \caption{} ”  
\[6\] ” \label{} ”  
\[7\] “\begin{tabular}{@\\extracolsep{5pt}lc}”  
\[8\] “\\\[-1.8ex\]\hline”  
\[9\] “\hline \\\[-1.8ex\]”  
\[10\] ” & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ ”  
\[11\] “\cline{2-2}”  
\[12\] “\\\[-1.8ex\] & ln\\Gdp\\pc \\ ”  
\[13\] “\hline \\\[-1.8ex\]”  
\[14\] ” l\\pop & $-0.510^{\*\*\*}$ \\ ”  
\[15\] ” & (0.009) \\ ”  
\[16\] ” & \\ ”  
\[17\] ” hc & 0.335<sup>\* \* \*</sup> \\ ”  
\[18\] ” & (0.013) \\ ”  
\[19\] ” & \\ ”  
\[20\] ” l\\cn & 0.515<sup>\* \* \*</sup> \\ ”  
\[21\] ” & (0.009) \\ ”  
\[22\] ” & \\ ”  
\[23\] ” ctfp & 1.135<sup>\* \* \*</sup> \\ ”  
\[24\] ” & (0.026) \\ ”  
\[25\] ” & \\ ”  
\[26\] ” Constant & 2.204<sup>\* \* \*</sup> \\ ”  
\[27\] ” & (0.067) \\ ”  
\[28\] ” & \\ ”  
\[29\] “\hline \\\[-1.8ex\]”  
\[30\] “Observations & 1,842 \\”  
\[31\] “R<sup>2</sup> & 0.967 \\”  
\[32\] “Adjusted R<sup>2</sup> & 0.967 \\”  
\[33\] “F Statistic & 13,557.430<sup>\* \* \*</sup> (df = 4; 1837) \\”  
\[34\] “\hline”  
\[35\] “\hline \\\[-1.8ex\]”  
\[36\] “\textit{Note:} & \multicolumn{1}{r}{<sup>\*</sup>p$\<$0.1;
<sup>\*\*</sup>p$\<$0.05; <sup>\* \* \*</sup>p$\<$0.01} \\”  
\[37\] “\end{tabular}”  
\[38\] “\end{table}”  
\[39\] “”  
\[40\] “% Table created by stargazer v.5.2.3 by Marek Hlavac, Social
Policy Institute. E-mail: marek.hlavac at gmail.com” \[41\] “% Date and
time: Thu, Aug 29, 2024 - 19:13:49”  
\[42\] “\begin{table}\[!htbp\] \centering”  
\[43\] ” \caption{} ”  
\[44\] ” \label{} ”  
\[45\] “\begin{tabular}{@\\extracolsep{5pt} c}”  
\[46\] “\\\[-1.8ex\]\hline”  
\[47\] “\hline \\\[-1.8ex\]”  
\[48\] “text \\”  
\[49\] “\hline \\\[-1.8ex\]”  
\[50\] “\end{tabular}”  
\[51\] “\end{table}”

Regression table for a two way fixed effects model

``` r
Two_Way <- Two_Way_Fix_Eff()
```

% Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy
Institute. E-mail: marek.hlavac at gmail.com % Date and time: Thu, Aug
29, 2024 - 19:13:50
% Table created by stargazer v.5.2.3 by Marek Hlavac, Social Policy
Institute. E-mail: marek.hlavac at gmail.com % Date and time: Thu, Aug
29, 2024 - 19:13:50
``` r
Two_Way
```

\[1\] “”  
\[2\] “% Table created by stargazer v.5.2.3 by Marek Hlavac, Social
Policy Institute. E-mail: marek.hlavac at gmail.com” \[3\] “% Date and
time: Thu, Aug 29, 2024 - 19:13:50”  
\[4\] “\begin{table}\[!htbp\] \centering”  
\[5\] ” \caption{} ”  
\[6\] ” \label{} ”  
\[7\] “\begin{tabular}{@\\extracolsep{5pt}lc}”  
\[8\] “\\\[-1.8ex\]\hline”  
\[9\] “\hline \\\[-1.8ex\]”  
\[10\] ” & \multicolumn{1}{c}{\textit{Dependent variable:}} \\ ”  
\[11\] “\cline{2-2}”  
\[12\] “\\\[-1.8ex\] & ln\\Gdp\\pc \\ ”  
\[13\] “\hline \\\[-1.8ex\]”  
\[14\] ” l\\pop & $-0.436^{\*\*\*}$ \\ ”  
\[15\] ” & (0.024) \\ ”  
\[16\] ” & \\ ”  
\[17\] ” hc & 0.065<sup>\*</sup> \\ ”  
\[18\] ” & (0.033) \\ ”  
\[19\] ” & \\ ”  
\[20\] ” l\\cn & 0.632<sup>\* \* \*</sup> \\ ”  
\[21\] ” & (0.010) \\ ”  
\[22\] ” & \\ ”  
\[23\] ” ctfp & 1.314<sup>\* \* \*</sup> \\ ”  
\[24\] ” & (0.032) \\ ”  
\[25\] ” & \\ ”  
\[26\] “\hline \\\[-1.8ex\]”  
\[27\] “Observations & 1,842 \\”  
\[28\] “R<sup>2</sup> & 0.819 \\”  
\[29\] “Adjusted R<sup>2</sup> & 0.809 \\”  
\[30\] “F Statistic & 1,975.083<sup>\* \* \*</sup> (df = 4; 1745) \\”  
\[31\] “\hline”  
\[32\] “\hline \\\[-1.8ex\]”  
\[33\] “\textit{Note:} & \multicolumn{1}{r}{<sup>\*</sup>p$\<$0.1;
<sup>\*\*</sup>p$\<$0.05; <sup>\* \* \*</sup>p$\<$0.01} \\”  
\[34\] “\end{tabular}”  
\[35\] “\end{table}”  
\[36\] “”  
\[37\] “% Table created by stargazer v.5.2.3 by Marek Hlavac, Social
Policy Institute. E-mail: marek.hlavac at gmail.com” \[38\] “% Date and
time: Thu, Aug 29, 2024 - 19:13:50”  
\[39\] “\begin{table}\[!htbp\] \centering”  
\[40\] ” \caption{} ”  
\[41\] ” \label{} ”  
\[42\] “\begin{tabular}{@\\extracolsep{5pt} c}”  
\[43\] “\\\[-1.8ex\]\hline”  
\[44\] “\hline \\\[-1.8ex\]”  
\[45\] “text \\”  
\[46\] “\hline \\\[-1.8ex\]”  
\[47\] “\end{tabular}”  
\[48\] “\end{table}”
