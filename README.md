# pibc : Extract Data from Pasar Induk Beras Cipinang

[Pasar Induk Beras Cipinang (PIBC)](https://www.foodstation.id) 

## Install

```
# install.packages("devtools")
devtools::install_github("aephidayatuloh/pibc")
```

## Usage

``` 
library(pibc)
price(from = "2023-07-30", to = "2023-07-31")
#> # A tibble: 2 × 15
#>   Tanggal    `Cianjur Kepala` `Cianjur Slyp` `Sentra Ramos` Saigon `Muncul I`
#>   <date>                <dbl>          <dbl>          <dbl>  <dbl>      <dbl>
#> 1 2023-07-31            15450          15075          14225  12800      11800
#> 2 2023-07-30            15450          15075          14225  12800      11800
#> # ℹ 9 more variables: `Muncul II` <dbl>, `Muncul III` <dbl>, `IR-64 I` <dbl>,
#> #   `IR-64 II` <dbl>, `IR-64 III` <dbl>, `IR-42` <dbl>,
#> #   `Ketan Putih Lokal` <dbl>, `Ketan Putih (Paris)` <dbl>, `Ketan Hitam` <dbl>
```

<sup>Created on 2023-08-02 with [reprex v2.0.2](https://reprex.tidyverse.org)</sup>

