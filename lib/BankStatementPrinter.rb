class BankStatementPrinter

  def self.printStatement(bank_account)
    puts "date || credit || debit || balance"
    bank_account.transactions.reverse.each do |transaction|
      puts transaction.to_s
    end
  end
end
