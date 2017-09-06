require 'statement_row'

describe StatementRow do
  let(:transaction) do
    double(:transaction,
            amount: -300,
            current_balance: 350,
            date: Date.new(2017, 9, 04))
  end
  let(:printed_row) { "04/09/2017 || || 300.00 || 350.00" }
  subject(:statement_row) { described_class.new(transaction) }

  describe '#to_string' do
    it 'returns a transaction as a formatted string' do
      expect(statement_row.to_string).to eq printed_row
    end
  end
end
