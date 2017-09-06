require 'account'

describe Account do
  let(:amount) { 400 }
  let(:transaction_history) { double(:transaction_history, save: nil) }
  let(:statement_printer) { double(:statement_printer) }
  subject(:account) { described_class.new(transaction_history, statement_printer) }

  describe '#balance' do
    it 'starts with a balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'increases the account balance by a given amount' do
      expect { account.deposit(amount) }.to change { account.balance }.by amount
    end

    it 'saves the transaction to the transaction history' do
      expect(transaction_history).to receive(:save)
      account.deposit(amount)
    end
  end

  describe '#withdraw' do
    it 'decreases the account balance by a given amount' do
      expect { account.withdraw(amount) }.to change { account.balance }.by(-amount)
    end

    it 'saves the transaction to the transaction history' do
      expect(transaction_history).to receive(:save)
      account.withdraw(amount)
    end
  end

  describe '#print_statement' do
    it 'calls the print method on the statement_printer object' do
      expect(statement_printer).to receive(:print_statement)
      account.print_statement
    end
  end
end
