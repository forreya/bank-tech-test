require 'Transaction'

RSpec.describe Transaction do
  describe "initialize" do
    it "should set the date, credit, debit, and balance" do
      transaction = Transaction.new(date: "01/01/2022", credit: 100, debit: nil, balance: 100)
      expect(transaction.date).to eq("01/01/2022")
      expect(transaction.credit).to eq(100)
      expect(transaction.debit).to be_nil
      expect(transaction.balance).to eq(100)
    end

    it "should raise an error if date or balance is missing" do
      expect { Transaction.new(credit: 100, debit: nil) }.to raise_error(ArgumentError)
      expect { Transaction.new(date: "01/01/2022", credit: nil, debit: nil) }.to raise_error(ArgumentError)
    end
  end

  describe "to_s" do
    it "should return a string representation of the transaction" do
      transaction = Transaction.new(date: "01/01/2022", credit: 100, debit: nil, balance: 100)
      expect(transaction.to_s).to eq("01/01/2022 || 100.00 ||  || 100.00")
    end

    it "should format amounts correctly" do
      transaction = Transaction.new(date: "01/01/2022", credit: 12.3456, debit: 78.9, balance: 33.33)
      expect(transaction.to_s).to eq("01/01/2022 || 12.35 || 78.90 || 33.33")
    end
  end
end
