require 'account'

describe Account do
  let(:amount) { 400 }
  let(:transaction_class) { double(:transaction_class) }
  let(:transaction_instance) { double(:transaction_instance) }
  subject(:account) { described_class.new(transaction_class) }

  it 'starts with a balance of 0' do
    expect(account.balance).to eq 0
  end

  before do
    allow(account.transaction_class).to receive(:new).and_return(transaction_instance)
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
end
