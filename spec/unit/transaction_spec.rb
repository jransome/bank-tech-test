require 'transaction'

describe Transaction do
  let(:amount) { 50 }
  let(:current_balance) { 100 }
  let!(:transaction_date) { Time.now.to_s } #NOTE: .to_s is added to avoid test failing due to nanosecond differences in actual vs expected time values
  subject(:transaction){ described_class.new(amount, current_balance) }

  describe '#date' do
    it 'records the date of the transaction' do
      expect(transaction.date.to_s).to eq transaction_date #NOTE: .to_s is added to avoid test failing due to nanosecond differences in actual vs expected time values
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
