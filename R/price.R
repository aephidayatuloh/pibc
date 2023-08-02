# pibc::price()
# This is function to extract price data history
#
#' @title Extract price data history
#' @description Get the price of rice within period.
#' @importFrom rvest read_html html_element html_table
#' @importFrom httr POST user_agent content
#' @importFrom dplyr mutate slice across
#' @importFrom readr parse_number
#' @param from start period data extraction format yyyy-mm-dd
#' @param to end period data extraction format yyyy-mm-dd
#' @examples
#' price(from = "2023-07-13", to = "2023-07-31")
#'
#'
#'
#' @export
price <- function(from, to = Sys.Date()){
  tryCatch(
    {
      from <- as.Date(from)
      to <- as.Date(to)
    },
    error = function(e){
      message("Error:")
      print(e)
    }
    )
  from <- as.Date(from)
  to <- as.Date(to)

  pibc_harga <- "https://foodstation.id/api/index.php?id=hargaberas"
  tbl_harga <- pibc_harga |>
    POST(
      body = list(tgl = format(from, "%d-%m-%Y"), tgl2 = format(to, "%d-%m-%Y")),
      user_agent("httr")
    ) |>
    content() |>
    html_element('body') |>
    html_table()

  harga_colnm <- tbl_harga |>
    slice(2)

  tbl_harga <- tbl_harga |>
    slice(-1*1:2) |>
    mutate(
      X1 = as.Date(X1, format = "%d-%b-%Y"),
      across(X2:X15, .fns = parse_number)
    )

  colnames(tbl_harga) <- harga_colnm
  return(tbl_harga)
}