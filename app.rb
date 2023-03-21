# frozen_string_literal: true

require './lib/bank_account'
require './lib/bank_statement_printer'

bank_account = BankAccount.new

bank_account.deposit(100)
bank_account.deposit(100)
bank_account.deposit(1000)
bank_account.withdraw(1200)
BankStatementPrinter.printStatement(bank_account)
