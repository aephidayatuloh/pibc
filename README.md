# pibc : Extract Data from Foodstation.id

[Pasar Induk Beras Cipinang (PIBC)](https://www.foodstation.id) 

## Install

```
# install.packages("devtools")
devtools::install_github("aephidayatuloh/pibc")
```

## Usage

```
library(pibc)
price(from = "2023-07-13", to = "2023-07-31")
```

If you run the code above, after the process finished you will have the script file named `sendgmail.R` in `myfolder` folder. But, if the script in the article in a output-block part (this usually in a box with white background, different writing style from writer) then use `output = TRUE` to make the output-block part of script output file.

