class StatementPrinter
  STATEMENT_HEADER = "date || credit || debit || balance\n"
  DATE_FORMAT = "%d/%m/%Y"

  def print(transaction_history)
    output_string = STATEMENT_HEADER

    transaction_history.reverse.each do |transaction|
      row = [transaction.date.strftime(DATE_FORMAT), '%.02f' % transaction.amount.abs, nil, '%.02f' % transaction.current_balance]
      row[1], row[2] = row[2], row[1] if transaction.amount.negative?
      output_string += (row.join(" || ") + "\n")
    end
  
    return output_string.chomp
  end

end
