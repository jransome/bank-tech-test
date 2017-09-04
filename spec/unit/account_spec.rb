require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:amount) { 400 }

  it 'starts with a balance of 0' do
    expect(account.balance).to eq 0
  end

  describe '#deposit' do
    it 'increases the account balance when a positive number is supplied' do
      expect{ account.deposit(amount) }.to change{ account.balance }.by amount
    end
  end

end
