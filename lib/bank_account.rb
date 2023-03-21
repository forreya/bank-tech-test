# frozen_string_literal: true

require_relative './Transaction'

# This class represents a bank account that can be used to deposit and withdraw funds.
# It maintains a balance and an array of transactions.
class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    validate_amount(amount)
    @balance += amount
    add_transaction(credit: amount, balance: @balance)
  end

  def withdraw(amount)
    validate_amount(amount)
    raise 'Insufficient funds' unless amount <= @balance

    @balance -= amount
    add_transaction(debit: amount, balance: @balance)
  end

  private

  def validate_amount(amount)
    raise TypeError, 'Invalid input: Amount must be a number' unless amount.is_a?(Numeric)
  end

  def add_transaction(balance:, credit: nil, debit: nil)
    date = Time.now.strftime('%d/%m/%Y')
    transaction = Transaction.new(date: date, credit: credit, debit: debit, balance: balance)
    @transactions.push(transaction)
  end
end
