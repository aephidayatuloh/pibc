test_that("column", {
  expect_equal(
    ncol(stock(m = 1)), 7
  )
})
test_that("column-name", {
  expect_equal(
    colnames(stock(m = 1))[1], "Tanggal"
  )
})

