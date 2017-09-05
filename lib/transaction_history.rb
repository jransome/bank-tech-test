require 'transaction'

class TransactionHistory
  attr_reader :transaction_class, :history

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @history = []
  end

  def save(amount, balance)
    @history << transaction_class.new(amount, balance)
  end
end
