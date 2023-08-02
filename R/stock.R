# pibc::stock()
# This is function to extract rice stock data history
#
#' @title Extract rice stock data history
#' @description Get the price of rice in a month current year.
#' @importFrom rvest read_html html_element html_table
#' @importFrom httr POST user_agent content
#' @importFrom dplyr mutate filter across select
#' @importFrom purrr map_dfr
#' @importFrom readr parse_number
#' @param m    integer indicate month. January = 1 and December = 12. You can omit `m` to get all stock data current year.
#' @examples
#' # to extract stock history on January current year (i.e 2023)
#' stock(m = 1)
#'
#' # to extract stock history on whole current year (i.e 2023)
#' stock()
#'
#'
#' @export
stock <- function(m = NULL){
  pibc_stock <- "https://foodstation.id/api/index.php?id=stockberas"

  if(is.null(m)){
    tbl_stock <- map_dfr(c(paste0("0", 1:9), 10:12), function(bln){
      pibc_stock |>
        POST(
          body = list(bln = bln),
          user_agent("httr")
        ) |>
        content() |>
        html_element('body') |>
        html_table() |>
        select(X1:X7)
    })

    stock_colnm <- tbl_stock |>
      filter(X1 == "Tanggal") |>
      head(1)
  } else if(m < 1 | m > 12){
    stop("The `m` should be integer between 1 and 12.")
  } else if(1 <= m & m <= 12){
    m <- as.integer(m)
    bln <- ifelse(m < 10, paste0("0", m), m)
    tbl_stock <- pibc_stock |>
      POST(
        body = list(bln = bln),
        user_agent("httr")
      ) |>
      content() |>
      html_element('body') |>
      html_table() |>
      select(X1:X7)

    stock_colnm <- tbl_stock |>
      filter(X1 == "Tanggal")
  }

  tbl_stock <- tbl_stock |>
    filter(!X1 %in% c("(Dalam Ton)", "Tanggal")) |>
    mutate(
      X1 = as.Date(X1, format = "%d-%b-%Y"),
      across(X2:X6, .fns = parse_number)
    )

  colnames(tbl_stock) <- stock_colnm
  return(tbl_stock)

}
