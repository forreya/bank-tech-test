require_relative './Transaction'

class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    validateAmount(amount)
    @balance += amount
    addTransaction(credit: amount, balance: @balance)
  end

  def withdraw(amount)
    validateAmount(amount)
    if amount <= @balance
      @balance -= amount
      addTransaction(debit: amount, balance: @balance)
    else
      raise "Insufficient funds"
    end
  end

  private

  def validateAmount(amount)
    raise TypeError.new("Invalid input: Amount must be a number") unless amount.is_a?(Numeric)
  end

  def addTransaction(credit: nil, debit: nil, balance:)
    date = Time.now.strftime("%d/%m/%Y")
    transaction = Transaction.new(date: date, credit: credit, debit: debit, balance: balance)
    @transactions.push(transaction)
  end
end