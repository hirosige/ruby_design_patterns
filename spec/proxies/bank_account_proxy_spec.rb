require 'spec_helper'

describe 'Bank Account' do
  it 'Can get amount' do
    bank_account_mock = double("BankAccount")
    bank_account_proxy = BankAccountProxy.new(bank_account_mock, "Taro")

    expect(bank_account_proxy.to_string).to eq "ok"
  end

  it 'Can initialize' do
    bank_account_mock = double("BankAccount")
    bank_account_proxy = BankAccountProxy.new(bank_account_mock, "Taro")

    expect(bank_account_proxy.owner_name).to eq "Taro"
  end

  it 'is not authorized' do
    bank_account_mock = double("BankAccount")
    bank_account_proxy = BankAccountProxy.new(bank_account_mock, "Taro")

    expect(bank_account_proxy.authorized?).to eq false
  end

  it 'is authorized' do
    bank_account_mock = double("BankAccount")
    bank_account_proxy = BankAccountProxy.new(bank_account_mock, "hiro")

    expect(bank_account_proxy.authorized?).to eq true
  end

  it 'unauthorized then cannot get balance' do
    owner_name = "Taro"
    bank_account_mock = double("BankAccount")
    bank_account_proxy = BankAccountProxy.new(bank_account_mock, owner_name)

    expect{ bank_account_proxy.balance }.to raise_error "Illegal access: #{owner_name} cannot access account."
  end

  it 'authorized then can get balance' do
    owner_name = "hiro"
    balance_amount = 30000

    bank_account_mock = double("BankAccount", :balance => balance_amount)
    allow(bank_account_mock).to receive(:balance).and_return(balance_amount)

    bank_account_proxy = BankAccountProxy.new(bank_account_mock, owner_name)

    expect{ bank_account_proxy.balance }.not_to raise_error
    expect(bank_account_proxy.balance).to eq balance_amount
  end

  it 'unauthorized then cannot deposit' do
    owner_name = "Taro"
    bank_account_mock = double("BankAccount")
    bank_account_proxy = BankAccountProxy.new(bank_account_mock, owner_name)

    expect{ bank_account_proxy.deposit(10000) }.to raise_error "Illegal access: #{owner_name} cannot access account."
  end

  it 'authorized then can deposit' do
    owner_name = "hiro"
    balance_amount = 30000
    deposit_amount = 10000

    bank_account_mock = double("BankAccount", :balance => balance_amount)
    allow(bank_account_mock).to receive(:deposit)
      .with(10000)
      .and_return(balance_amount + deposit_amount)

    bank_account_proxy = BankAccountProxy.new(bank_account_mock, owner_name)

    expect{ bank_account_proxy.deposit(10000) }.not_to raise_error
    expect(bank_account_proxy.deposit(10000)).to eq 40000
  end

  it 'unauthorized then cannot withdraw' do
    owner_name = "Taro"
    bank_account_mock = double("BankAccount")
    bank_account_proxy = BankAccountProxy.new(bank_account_mock, owner_name)

    expect{ bank_account_proxy.withdraw(10000) }.to raise_error "Illegal access: #{owner_name} cannot access account."
  end

  it 'authorized then can deposit' do
    owner_name = "hiro"
    balance_amount = 30000
    withdraw_amount = 10000

    bank_account_mock = double("BankAccount", :balance => balance_amount)
    allow(bank_account_mock).to receive(:withdraw)
      .with(withdraw_amount)
      .and_return(balance_amount - withdraw_amount)

    bank_account_proxy = BankAccountProxy.new(bank_account_mock, owner_name)

    expect{ bank_account_proxy.withdraw(10000) }.not_to raise_error
    expect(bank_account_proxy.withdraw(10000)).to eq 20000
  end
end