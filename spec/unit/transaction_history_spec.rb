require 'transaction_history'

describe TransactionHistory do
  let(:balance) { 100 }
  let(:amount) { 20 }
  let(:transaction_instance) { double(:transaction_instance) }
  let(:transaction_class) { double(:transaction_class, new: transaction_instance) }
  subject(:transaction_history) { described_class.new(transaction_class) }

  describe '#save' do
    it 'should create an instance of a transaction' do
      expect(transaction_class).to receive(:new)
      transaction_history.save(amount, balance)
    end

    it 'should store the new transaction' do

      expect { transaction_history.save(amount, balance) }.to change{ transaction_history.history.length }.by 1
    end
  end

end
