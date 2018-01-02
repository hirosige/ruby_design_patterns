require 'spec_helper'

describe 'Bank Account' do
  before(:each) do
    @bank_account = BankAccount.new(30000)
  end
  it 'Can get amount' do
    expect(@bank_account.balance).to eq 30000
  end

  it 'Can deposit' do
    @bank_account.deposit(10000)
    expect(@bank_account.balance).to eq 40000
  end

  it 'Can deposit other amount' do
    @bank_account.deposit(20000)
    expect(@bank_account.balance).to eq 50000
  end

  it 'Can withdraw' do
    @bank_account.withdraw(10000)
    expect(@bank_account.balance).to eq 20000
  end

  it 'Can withdraw' do
    @bank_account.withdraw(20000)
    expect(@bank_account.balance).to eq 10000
  end
end