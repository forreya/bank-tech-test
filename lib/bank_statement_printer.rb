# frozen_string_literal: true

# This class is responsible for printing out the transactions of a bank account in a statement format.
class BankStatementPrinter
  def self.print_statement(bank_account)
    puts 'date || credit || debit || balance'
    bank_account.transactions.reverse.each do |transaction|
      puts transaction.to_s
    end
  end
end
