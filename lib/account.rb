require_relative 'transaction'

class Account
  attr_reader :balance, :transaction_class, :transaction_history

  def initialize(transaction_class = Transaction)
    @balance = 0
    @transaction_class = transaction_class
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    record_transaction(amount, @balance)
  end

  def withdraw(amount)
    @balance -= amount
    record_transaction(-amount, @balance)
  end

  private

  def record_transaction(amount, new_balance)
    transaction = @transaction_class.new(amount, @balance)
    @transaction_history.push(transaction)
  end
end
