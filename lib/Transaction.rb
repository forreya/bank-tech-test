class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(date:, credit: nil, debit: nil, balance:)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def to_s
    "#{date} || #{formatAmount(credit)} || #{formatAmount(debit)} || #{formatAmount(balance)}"
  end

  private

  def formatAmount(amount)
    amount ? sprintf("%.2f", amount) : ""
  end
end