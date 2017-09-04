class Transaction
  attr_reader :amount, :current_balance

  def initialize(amount, current_balance)
    @amount = amount
    @current_balance = current_balance
  end
end
