test_that("calc_grass_age works", {
  expect_equal(
    calc_grass_age(
      ID = c(1, 1, 1, 1, 1),
      B_LU_BRP = c(265, 265, 1079, 1079, 1079)
    ),
    expected = c(2, 2, 2, 2, 2),
    tolerance = 0.1
  )
  expect_equal(
    calc_grass_age(
      ID = c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2),
      B_LU_BRP = c(265, 265, 1079, 1079, 1079, 237,237, 265, 265, 265, 308, 308, 265)
    ),
    expected = c(2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4),
    tolerance = 0.1
  )
})