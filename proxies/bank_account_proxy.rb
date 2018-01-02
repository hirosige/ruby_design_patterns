require 'etc'

class BankAccountProxy
  def initialize(real_object, owner_name)
    @real_object = real_object
    @owner_name = owner_name
  end

  def to_string
    "ok"
  end

  def owner_name
    @owner_name
  end

  def balance
    check_access
    @real_object.balance
  end

  def deposit(amount)
    check_access
    @real_object.deposit(amount)
  end

  def withdraw(amount)
    check_access
    @real_object.withdraw(amount)
  end

  def authorized?
    Etc.getlogin === @owner_name
  end

  def check_access
    unless authorized?
      raise "Illegal access: #{@owner_name} cannot access account."
    end
  end
end