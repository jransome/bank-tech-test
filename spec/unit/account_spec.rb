require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:amount) { 400 }

  it 'starts with a balance of 0' do
    expect(account.balance).to eq 0
  end

  shared_examples "adds to transaction history" do
    it 'adds the transaction to the transaction history' do
      skip("pending transaction implementation"){ account.deposit(amount) }.to change{ account.transaction_history }.by 1
    end
  end

  describe '#deposit' do
    it 'increases the account balance by a given amount' do
      expect{ account.deposit(amount) }.to change{ account.balance }.by amount
    end

    include_examples "adds to transaction history"
  end

  describe '#withdraw' do
    it 'decreases the account balance by a given amount' do
      expect{ account.withdraw(amount) }.to change{ account.balance }.by (-amount)
    end

    include_examples "adds to transaction history"
  end
end
