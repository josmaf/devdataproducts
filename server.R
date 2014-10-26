# Load library
library(shiny)

# Function to calculate monthly payment
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

# Server function
shinyServer(
  function(input, output) {    
    
    # Put calculated data in output var
    output$result <- renderTable({ 
      # Calculate 
      m <- mortgage(input$loanAmount, input$interestRate , input$loanTerm)
      rows <- c("Monthly:", "Yearly:")    
     
      # Label data
      a <- c("Monthly:", "Yearly:")
      # Calculated data
      b <- c(m,m*12)
      # Create dataframe
      df <- data.frame(a,b)
      # Assign names to columns
      colnames(df) <- c("","Amount (€)")  
      
      # Print dataframe
      print(format(df, digits=2))      
    })  
    
  }
)
