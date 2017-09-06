require 'statement_printer'

describe StatementPrinter do
  let(:printed_statement) do
    "date || credit || debit || balance\n12/08/2017 || 500.00 || || 500.00"
  end
  let(:transaction_history) { [double(:transaction)] }
  let(:statement_row_output) { "12/08/2017 || 500.00 || || 500.00" }
  let(:statement_row_instance) { double(:statement_row_instance, to_string: statement_row_output) }
  let(:statement_row_class) { double(:statement_row_class, new: statement_row_instance) }
  subject(:statement_printer) { described_class.new }

  describe '#print' do
    it 'creates an instance of StatementRow for a given transaction' do
      expect(statement_row_class).to receive(:new)
      statement_printer.print_statement(transaction_history, statement_row_class)
    end

    it 'prints a statement with a header' do
      expect { statement_printer.print_statement(transaction_history, statement_row_class) }.to output(printed_statement).to_stdout
    end
  end
end
