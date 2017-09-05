require 'statement_printer'

describe StatementPrinter do
  let(:printed_statement) do
    "date || credit || debit || balance
04/09/2017 || || 300.00 || 350.00
01/09/2017 || 150.00 || || 650.00
12/08/2017 || 500.00 || || 500.00"
  end

  let(:transaction_1) do
    double(:transaction,
            amount: 500,
            current_balance: 500,
            date: Date.new(2017, 8, 12))
  end

  let(:transaction_2) do
    double(:transaction,
            amount: 150,
            current_balance: 650,
            date: Date.new(2017, 9, 01))
  end

  let(:transaction_3) do
    double(:transaction,
            amount: -300,
            current_balance: 350,
            date: Date.new(2017, 9, 04))
  end

  let(:transaction_history) { [transaction_1, transaction_2, transaction_3] }
  subject(:statement_printer) { described_class.new }

  describe '#print' do
    it 'prints a statement' do
      expect{statement_printer.print_statement(transaction_history)}.to output(printed_statement).to_stdout
    end
  end
end
