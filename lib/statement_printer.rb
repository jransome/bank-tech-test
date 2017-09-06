require_relative 'statement_row'

class StatementPrinter
  STATEMENT_HEADER = "date || credit || debit || balance\n"
  DATE_FORMAT = "%d/%m/%Y"

  def print_statement(transaction_history)
    output_string = STATEMENT_HEADER
    transaction_history.reverse.each { |transaction| output_string += print_row(transaction) }
    print output_string.chomp
  end

  private

  def print_row(transaction)
    row = [format_date(transaction.date), format_amount(transaction.amount.abs), nil, format_amount(transaction.current_balance)]
    row[1], row[2] = row[2], row[1] if transaction.amount.negative?
    row.join("|| ").chomp(' ') + "\n"
  end

  def format_amount(amount)
    '%.02f' % amount + ' '
  end

  def format_date(date)
    date.strftime(DATE_FORMAT) + ' '
  end

end
