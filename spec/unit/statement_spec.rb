require 'statement_printer'

describe StatementPrinter do
  let(:printed_statement) { "date || credit || debit || balance
04/09/2017 ||  || 300.00 || 350.00
01/09/2017 || 150.00 ||  || 650.00
12/08/2017 || 500.00 ||  || 500.00" }
  let(:transaction_1) { double(:transaction,
                                amount: 500,
                                current_balance: 500,
                                date: Time.new(2017, 8, 12)) }
  let(:transaction_2) { double(:transaction,
                                amount: 150,
                                current_balance: 650,
                                date: Time.new(2017, 9, 01)) }
  let(:transaction_3) { double(:transaction,
                                amount: -300,
                                current_balance: 350,
                                date: Time.new(2017, 9, 04)) }
  let(:transaction_history) { [transaction_1, transaction_2, transaction_3] }
  subject(:statement_printer) { described_class.new }

  describe '#print' do
    it 'prints a statement' do
      expect(statement_printer.print(transaction_history)).to eq printed_statement
    end
  end
end
