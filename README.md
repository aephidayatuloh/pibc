# pibc : Extract Data from Pasar Induk Beras Cipinang

[Pasar Induk Beras Cipinang (PIBC)](https://www.foodstation.id) can be access on https://www.foodstation.id.

## Install

```
# install.packages("remotes")
remotes::install_github("aephidayatuloh/pibc")
```

## Usage

Get historical price

``` 
library(pibc)
price(from = "2023-07-30", to = "2023-07-31")
```

Extract stock history on a month or whole current year

``` 
library(pibc)

# Extract stock on January current year
stock(m = 1)

# Extract stock on a whole current year
stock()
```
