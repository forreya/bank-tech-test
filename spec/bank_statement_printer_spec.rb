# frozen_string_literal: true

require 'bank_statement_printer'

RSpec.describe BankStatementPrinter do
  before(:each) do
    @bank_account = BankAccount.new
    @bank_account.deposit(1000)
    @bank_account.withdraw(500)
  end

  it 'should print the statement, correctly formatted, in reverse chronological order' do
    today = Time.now.strftime('%d/%m/%Y')
    expect { BankStatementPrinter.print_statement(@bank_account) }.to output(
      "date || credit || debit || balance\n" \
      "#{today} ||  || 500.00 || 500.00\n" \
      "#{today} || 1000.00 ||  || 1000.00\n"
    ).to_stdout
  end
end
