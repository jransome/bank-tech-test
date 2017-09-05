require 'transaction'
require 'date'

describe Transaction do
  let(:amount) { 50 }
  let(:current_balance) { 100 }
  let!(:transaction_date) { Date.today }
  subject(:transaction){ described_class.new(amount, current_balance) }

  describe '#date' do
    it 'records the date of the transaction' do
      expect(transaction.date).to eq transaction_date
    end
  end

  describe '#amount' do
    it 'records an amount' do
      expect(transaction.amount).to eq amount
    end
  end

  describe '#current_balance' do
    it 'records the new balance' do
      expect(transaction.current_balance).to eq current_balance
    end
  end
end
