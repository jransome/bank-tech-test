class StatementPrinter
  STATEMENT_HEADER = "date || credit || debit || balance\n"
  DATE_FORMAT = "%d/%m/%Y"

  def print(transaction_history)
    output_string = STATEMENT_HEADER
    transaction_history.reverse.each do |transaction|
      output_string += print_row(transaction)
    end
    return output_string.chomp
  end

  private

  def print_row transaction
    row = [transaction.date.strftime(DATE_FORMAT), format_amount(transaction.amount.abs), nil, format_amount(transaction.current_balance)]
    row[1], row[2] = row[2], row[1] if transaction.amount.negative?
    row.join(" || ") + "\n"
  end

  def format_amount amount
    '%.02f' % amount
  end

end
