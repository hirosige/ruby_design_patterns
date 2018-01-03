require 'spec_helper'

describe 'Employee' do
  before(:each) do
    @employee = Employee.new("hiro", "manager", 10000)
  end

  it 'Can add observer' do
    payroll = double('Payroll')
    allow(payroll).to receive(:update)

    expect{ @employee.add_observer(payroll) }.not_to raise_error
  end

  it 'Can trigger changed' do
    expect{ @employee.changed }.not_to raise_error
  end

  it 'Can notify observers' do
    payroll = double('Payroll')
    allow(payroll).to receive(:update)

    expect{ @employee.notify_observers(@employee) }.not_to raise_error
  end

  it 'Can set' do
    expect(@employee.count_observers).to eq 2
  end

  it 'Can get name' do
    expect(@employee.name).to eq 'hiro'
  end

  it 'Can get title' do
    expect(@employee.title).to eq 'manager'
  end

  it 'Can get salary' do
    expect(@employee.salary).to eq 10000
  end

  it 'Can change overridden salary' do

  end
end
