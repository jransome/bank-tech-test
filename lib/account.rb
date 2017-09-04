class Account
  attr_reader :balance, :transaction_class, :transaction_history

  def initialize(transaction_class)
    @balance = 0
    @transaction_class = transaction_class
    @transaction_history = []
  end

  def deposit amount
    @balance += amount
    transaction = @transaction_class.new(amount)
    @transaction_history.push(transaction)
  end

  def withdraw amount
    @balance -= amount
    transaction = @transaction_class.new(-amount)
    @transaction_history.push(transaction)
  end
end
