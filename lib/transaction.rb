require 'date'

class Transaction
  attr_reader :amount, :current_balance, :date

  def initialize(amount, current_balance)
    @amount = amount
    @current_balance = current_balance
    @date = Date.today
  end
end
