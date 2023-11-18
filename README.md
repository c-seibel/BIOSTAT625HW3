# BIOSTAT625HW3
<!-- badges: start -->
  [![R-CMD-check](https://github.com/c-seibel/BIOSTAT625HW3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/c-seibel/BIOSTAT625HW3/actions/workflows/R-CMD-check.yaml)
  <!-- badges: end -->
  
<!-- badges: start -->
  [![Codecov test coverage](https://codecov.io/gh/c-seibel/BIOSTAT625HW3/branch/master/graph/badge.svg)](https://app.codecov.io/gh/c-seibel/BIOSTAT625HW3?branch=master)
  <!-- badges: end -->

<h2> BIOSTAT 625 HW 3 </h2>

<h3> Linear Model Package </h3>
by Caitlin Seibel

The goal of this package is to fit a linear regression model, comparable to using `lm`. The `linearModel` function is able to fit a simple or multiple linear regression model, with both continuous and categorical covariates. The function returns values from the fitted linear model, such as coefficients, residuals, and fitted values. The user can specify `print.summary = TRUE` to include a summary table in the output of the function. This summary table is very similar to using `summary()` on an `lm`. The summary table includes a coefficient estimate, standard error, t statistic, and p-value for each of the predictors in the specified linear model. Also, the summary includes residual standard error, R-squared, adjusted R-squared, and F-statistic/p-value for the model. 

<h3> Installation </h3>
This package can be installed using the following code in R/RStudio:

```
install.packages("devtools")
install.packages("bench")
devtools::install.github("c-seibel/BIOSTAT625HW3", build_vignettes = T)
library(BIOSTAT625HW3)
```

<h3> Functions </h3>

`linearModel`: a function that fits a simple or multiple linear regression model.

This function has three arguments: `formula`, `data`, and `print.summary`. The `formula` argument specifies the form (y ~ x) of the linear regression model to be fit. `data` is a data.frame used to fit the specified model, and should include all of the variables from the given formula. `print.summary` is a Boolean (TRUE or FALSE) that indicates if the user wants to print a summary of the model results. More detailed information about this function can be seen using `?linearModel`.

<h3> Example </h3>

```
data('iris')
form <- as.formula(Sepal.Length ~ Petal.Length)
model <- linearModel(formula = form, data = iris, print.summary = TRUE)
```

For more detailed information about the package and a comparison to the existing `lm()` function, please refer to the vignette by using

```
browseVignettes("BIOSTAT625HW3")
```
