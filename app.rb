require './lib/BankAccount.rb'
require './lib/BankStatementPrinter'

bankAccount = BankAccount.new()

bankAccount.deposit(100)
bankAccount.deposit(100)
bankAccount.deposit(1000)
bankAccount.withdraw(1200)
BankStatementPrinter.printStatement(bankAccount)