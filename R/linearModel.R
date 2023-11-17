#'Linear Model
#'
#'The function linearModel is used to fit a simple or multiple linear regression model
#'
#'@param formula a formula object that specifies the form of the model to be fitted.
#'@param data a data frame containing the variables to be used in the linear regression.
#'@param print.summary Boolean indicator for printing a summary table
#'
#'@return a list of results including coefficients, residuals, and fitted values.
#'
#'@examples
#'data <- iris
#'form <- as.formula(Sepal.Length ~ Sepal.Width + Petal.Width + Petal.Length + Species)
#'lm1 <- linearModel(formula = form, data = iris, print.summary = TRUE)
#'
#'@export



linearModel <- function(formula, data, print.summary){

  #set up design matrix and response vector
  X <- model.matrix(formula, data = data)
  Y <- model.response(model.frame(formula, data = data))
  n <- nrow(X) #number of observations
  p <- ncol(X) #number of covariates + 1

  #calculate coefficient estimates
  betahat <- solve(t(X)%*%X) %*% t(X) %*% Y

  #calculate fitted values
  Yhat <- X %*% betahat

  #calculate residuals
  epsilonhat <- Y - Yhat

  #calculate sigma squared (residual standard error)
  sigma_squared <- t(epsilonhat) %*% epsilonhat/(n-p)
  sigma <- sqrt(sigma_squared)

  #calculate variance matrix of beta estimates
  var_betahat <- ( solve(t(X)%*%X) )*c(sigma_squared)


  #standard error of beta estimates
  se_betahat <- sqrt(diag(var_betahat))

  #t test statistics
  t_stat <- betahat / se_betahat

  #p-value
  p_val <- ifelse(t_stat > 0, 2*(1-pt(t_stat, df = n-p)), 2*pt(t_stat, df = n-p))
  signif <- ifelse(format(p_val,scientific = F) < 0.05, "*", "")
  p_val <- ifelse(p_val == 0, "< 2e-16", p_val)

  #R-squared
  SSE <- sum(epsilonhat^2)
  TSS <- sum((Y - mean(Y))^2)
  R_2 <- 1 - (SSE/TSS)

  R_2_adj <- 1 - (((1-R_2)*(n-1))/(n-p))

  #F-statistic
  SSR <- sum((Yhat - mean(Y))^2)
  df1 <- p-1
  df2 <- n-p
  MSR <- SSR/df1
  MSE <- SSE/df2
  F_stat <- MSR/MSE
  p_F <- 1-pf(F_stat, df1 = df1, df2=df2)
  p_valF <- ifelse(p_F == 0, "< 2e-16", p_F)

  #format table for output
  output_table <- data.frame(Estimate = betahat,
                             SE = se_betahat,
                             t_value = t_stat,
                             p_value = p_val,
                             signif0.05 = signif)

  #print summary of results
  if(print.summary == T){
    print("Linear Model Results:")
    print("Formula: ")
    print(formula)
    print("Residuals:")
    print(paste(summary(epsilonhat)))
    print("Coefficients: ")
    print(output_table)
    print("* indicates significance at level 0.05")
    print("-----")
    print(paste("Residual standard error: ", round(sigma, 4)))
    print(paste("Multiple R-squared: ", round(R_2,4)))
    print(paste("Adjusted R-squared: ", round(R_2_adj,4)))
    print(paste("F-statistic: ", round(F_stat,4), " on ", df1, " and ", df2, "DF, p-value: ", p_valF))
  }

  #values to return
  results <- list(coefficients = betahat,
                  residuals = epsilonhat,
                  fitted.values = Yhat)

  return(results)
}
