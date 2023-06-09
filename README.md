# Bank Tech Test

This is my solution for a Bank tech test by [@makersacademy](https://github.com/makersacademy). It provides a Ruby implementation that allows for deposits, withdrawals and printing of an account statement.

## Getting Started
1. Clone the repository.
2. Run `bundle install` to install the required dependencies.

## Usage
The application can be run in a REPL environment like `IRB`. Here's an example of how to use it:

```
require './lib/bank_account'
require './lib/bank_statement_printer'

bank_account = BankAccount.new
bank_account.deposit(1000)
bank_account.deposit(2000)
bank_account.withdraw(500)
BankStatementPrinter.print_statement(bank_account)
```

This should output a bank statement similar to this (dates will differ):

```
date || credit || debit || balance
21/03/2023 ||  || 500.00 || 2500.00
21/03/2023 || 2000.00 ||  || 3000.00
21/03/2023 || 1000.00 ||  || 1000.00
```

## Testing
To run all tests, use the command `rspec` in the terminal. The `simplecov` gem should generate a coverage report of the test run and display a test coverage of above 95%.

## Approach
The program separates the bank functionality into different classes. This makes the code easier to understand and maintain, as each class has a specific responsibility. 

- The BankAccount class is responsible for managing the account balance and transactions.
- The BankStatementPrinter class is responsible for printing the statement.
- The Transaction class represents a single transaction.

The program uses the `attr_reader` method to create getters for instance variables, which makes it easy to access them from other parts of the program. The BankAccount class also includes input validation to ensure that the user inputs a numeric amount when depositing or withdrawing money.