require 'transaction'

describe Transaction do
  let(:amount) { 50 }
  subject(:transaction){ described_class.new(amount) }

  it 'has an amount' do
    expect(transaction.amount).to eq amount
  end
end
