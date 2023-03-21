# frozen_string_literal: true

# This class represents a single transaction in a bank account.
class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(date:, balance:, credit: nil, debit: nil)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def to_s
    "#{date} || #{format_amount(credit)} || #{format_amount(debit)} || #{format_amount(balance)}"
  end

  private

  def format_amount(amount)
    amount ? format('%.2f', amount) : ''
  end
end
