# frozen_string_literal: true

require './lib/bank_account'
require './lib/bank_statement_printer'

bank_account = BankAccount.new
bank_account.deposit(50_000)
bank_account.withdraw(30_000)
bank_account.deposit(100)
bank_account.deposit(100)
bank_account.deposit(1000)
bank_account.withdraw(1200)
BankStatementPrinter.print_statement(bank_account)
