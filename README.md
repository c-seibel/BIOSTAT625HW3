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

<h3> Installation </h3>
This package can be installed using the following code in R/RStudio:

```
install.packages("devtools")
install.packages("bench")
devtools::install.github("c-seibel/BIOSTAT625HW3")
```

<h3> Functions </h3>

`linearModel`: a function that fits a simple or multiple linear regression model.
This model has three arguments: `formula`, `data`, and `print.summary`. The `formula` argument specifies the form (y ~ x) of the linear regression model to be fit. `data` is a data.frame used to fit the specified model, and should include all of the variables from the given formula. `print.summary` is a Boolean (TRUE or FALSE) that indicates if the user wants to print a summary of the model results. More detailed information about this function can be seen using `?linearModel`.
