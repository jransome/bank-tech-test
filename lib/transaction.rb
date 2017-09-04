class Transaction
  attr_reader :amount, :current_balance, :date

  def initialize(amount, current_balance)
    @amount = amount
    @current_balance = current_balance
    @date = Time.now
  end
end
