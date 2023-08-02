test_that("column", {
  expect_equal(
    ncol(price(from = "2023-07-13", to = "2023-07-31")), 15
  )
})
test_that("row", {
  expect_equal(
    nrow(price(from = "2023-07-13", to = "2023-07-31")), 19
  )
})

