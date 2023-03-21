# frozen_string_literal: true

require 'bank_account'

RSpec.describe BankAccount do
  describe 'initialize' do
    it 'initializes with a balance of 0' do
      account = BankAccount.new
      expect(account.balance).to eq(0)
    end

    it 'initializes with an empty transactions array' do
      account = BankAccount.new
      expect(account.transactions).to eq([])
    end
  end

  describe 'deposit' do
    before(:each) do
      @account = BankAccount.new
      @initial_balance = @account.balance
      @amount = 100
      @account.deposit(@amount)
    end

    it 'increases the account balance' do
      expect(@account.balance).to eq(@initial_balance + @amount)
    end

    it 'adds a new transaction to the account' do
      expect(@account.transactions.length).to eq(1)
      expect(@account.transactions[0].credit).to eq(@amount)
    end

    it 'should raise an error if the deposit amount is not a number' do
      account = BankAccount.new
      expect { account.deposit('100') }.to raise_error(TypeError, 'Invalid input: Amount must be a number')
    end
  end

  describe 'withdraw' do
    it 'should raise an error if the withdrawal amount is not a number' do
      account = BankAccount.new
      expect { account.withdraw('50') }.to raise_error(TypeError, 'Invalid input: Amount must be a number')
    end

    context 'when amount is less than or equal to balance' do
      before(:each) do
        @account = BankAccount.new
        @account.deposit(100)
        @initial_balance = @account.balance
        @amount_withdrawed = 50
        @account.withdraw(@amount_withdrawed)
      end

      it 'should decrease the balance by the withdrawn amount' do
        expect(@account.balance).to eq(@initial_balance - @amount_withdrawed)
      end

      it 'should add a transaction with a debit amount and updated balance' do
        transaction = @account.transactions.last
        expect(transaction.debit).to eq(@amount_withdrawed)
        expect(transaction.balance).to eq(@initial_balance - @amount_withdrawed)
      end
    end

    context 'when amount is greater than balance' do
      before(:each) do
        @account = BankAccount.new
        @account.deposit(100)
        @initial_balance = @account.balance
        @amount_withdrawed = 150
      end

      it 'should raise an error' do
        expect { @account.withdraw(@amount_withdrawed) }.to raise_error('Insufficient funds')
      end

      it 'should not change the balance or add a new transaction' do
        expect(@account.balance).to eq(@initial_balance)
        expect(@account.transactions.length).to eq(1)
      end
    end
  end
end
