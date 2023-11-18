test_that("linearModel works", {
  expect_equal(as.numeric(linearModel(formula = Sepal.Length ~ Petal.Length, data = iris, print.summary = F)$coefficients),
               as.numeric(lm(Sepal.Length ~ Petal.Length, data = iris)$coefficients))

  expect_equal(as.numeric(linearModel(formula = Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species, data = iris, print.summary = F)$coefficients),
               as.numeric(lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species, data = iris)$coefficients))

  expect_equal(as.numeric(linearModel(formula = Sepal.Length ~ Petal.Length, data = iris, print.summary = F)$residuals),
               as.numeric(lm(Sepal.Length ~ Petal.Length, data = iris)$residuals))

  expect_equal(as.numeric(linearModel(formula = Sepal.Length ~ Petal.Length, data = iris, print.summary = T)$residuals),
               as.numeric(lm(Sepal.Length ~ Petal.Length, data = iris)$residuals))

  expect_output(linearModel(formula = Sepal.Length ~ Petal.Length, data = iris, print.summary = T))

})
