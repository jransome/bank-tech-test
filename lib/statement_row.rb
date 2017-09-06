class StatementRow

  attr_reader :transaction
  DATE_FORMAT = "%d/%m/%Y"

  def initialize(transaction)
    @transaction = transaction
  end

  def to_string
    "#{date} ||#{credit} ||#{debit} ||#{balance}"
  end

  private

  def format_amount(amount)
    ' %.02f' % amount
  end

  def date
    transaction.date.strftime(DATE_FORMAT)
  end

  def credit
    format_amount(transaction.amount) unless transaction.amount.negative?
  end

  def debit
    format_amount(transaction.amount.abs) if transaction.amount.negative?
  end

  def balance
    format_amount(transaction.current_balance)
  end

end
