Mortgage Calculator
========================================================
author: josmaf


Slide 1
====================================

Introduction
========================================================

The program calculates the monthly and yearly payments of a fixed rate mortgage.

Simply enter the amount you wish to, the interest rate and the term over which you intend to pay it off.

The program automatically computes:

1. Monthly payment
2. Yearly payment

Slide 2
====================================

Core function
========================================================

Monthly payment is calculated using:


```r
# Function that computes monthly payment
mortgage <- function(loanAmount, interestRate, loanTerm) {
  
  # Monthly interest 
  mInterest <- interestRate / 12  
  # Auxiliar term
  term <- 1 + mInterest / 100
  # Calculate monthly amount  
  amount <- loanAmount * mInterest / (  100 * (1 - term^(-12*loanTerm) ))
 
  # return amount
  if (is.nan(amount)) 0
  else amount
  
}
```


