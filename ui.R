# Load library
library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Mortgage Payment Calculator"),
  
  sidebarPanel(
    h4('Input parameters'),
    numericInput('loanAmount', 'Loan Amount (€)', 0, min = 0),
    numericInput('interestRate', 'Interest Rate (%)', 0, min = 0, step = 0.1),
    numericInput('loanTerm', 'Loan Term (years)', 0, min = 0),
    submitButton('Submit')    
    
  ),
  mainPanel(
    h4('Instructions:'),
    helpText("Complete your mortgage information on the left and press 'Submit' button to get monthly and yearly payments."),
    br(),
    h4('Payments:'),
    
    # Print output
    tableOutput("result")
    
  )
  
))