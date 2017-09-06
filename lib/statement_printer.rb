require_relative 'statement_row'

class StatementPrinter
  STATEMENT_HEADER = "date || credit || debit || balance"

  def print_statement(transaction_history, statement_row_class = StatementRow)
    statement_rows = transaction_history.reverse.map do |transaction|
      create_row_string(transaction, statement_row_class)
    end
    print ([STATEMENT_HEADER] + statement_rows).join("\n")
  end

  private

  def create_row_string(transaction, statement_row_class = StatementRow)
    statement_row_class.new(transaction).to_string
  end

end
