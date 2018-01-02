class BankAccount
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end

  def balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end