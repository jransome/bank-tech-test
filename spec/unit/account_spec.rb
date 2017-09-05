require 'account'

describe Account do
  let(:amount) { 400 }
  let(:transaction_instance) { double(:transaction_instance) }
  let(:transaction_class) { double(:transaction_class, new: transaction_instance) }
  let(:statement_printer) { double(:statement_printer) }
  subject(:account) { described_class.new(transaction_class, statement_printer) }


  describe '#balance' do
    it 'starts with a balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'increases the account balance by a given amount' do
      expect{ account.deposit(amount) }.to change{ account.balance }.by amount
    end

    it 'adds the transaction to the transaction history' do
      expect{ account.deposit(amount) }.to change{ account.transaction_history.length }.by 1
    end
  end

  describe '#withdraw' do
    it 'decreases the account balance by a given amount' do
      expect{ account.withdraw(amount) }.to change{ account.balance }.by (-amount)
    end

    it 'adds the transaction to the transaction history' do
      expect{ account.withdraw(amount) }.to change{ account.transaction_history.length }.by 1
    end
  end

  describe '#print_statement' do
    it 'calls the print method on the statement_printer object' do
      expect(statement_printer).to receive(:print_statement)
      account.print_statement
    end
  end
end
