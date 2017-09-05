require_relative 'transaction_history'
require_relative 'statement_printer'

class Account
  attr_reader :balance, :transaction_class, :transaction_history, :statement_printer
  INITIAL_BALANCE = 0

  def initialize(transaction_history = TransactionHistory.new, statement_printer = StatementPrinter.new)
    @balance = INITIAL_BALANCE
    @statement_printer = statement_printer
    @transaction_history = transaction_history
  end

  def deposit(amount)
    @balance += amount
    transaction_history.save(amount, balance)
  end

  def withdraw(amount)
    @balance -= amount
    transaction_history.save(-amount, balance)
  end

  def print_statement
    statement_printer.print_statement(transaction_history.history)
  end

end
