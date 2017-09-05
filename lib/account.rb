require_relative 'transaction'
require_relative 'statement_printer'

class Account
  attr_reader :balance, :transaction_class, :transaction_history
  INITIAL_BALANCE = 0

  def initialize(transaction_class = Transaction, statement_printer = StatementPrinter.new)
    @balance = INITIAL_BALANCE
    @statement_printer = statement_printer
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

  def print_statement
    @statement_printer.print_statement(@transaction_history)
  end

  private

  def record_transaction(amount, new_balance)
    transaction = @transaction_class.new(amount, @balance)
    @transaction_history.push(transaction)
  end
end
