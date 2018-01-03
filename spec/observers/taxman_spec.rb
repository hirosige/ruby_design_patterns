require 'spec_helper'

describe 'Taxman' do
  before(:each) do
    @tax_man = TaxMan.new()
  end

  it 'can update' do
    employee = double('Employee', :name => 'hiro', :title => 'manager', :salary => 10000)
    expected_msg = "#{employee.name}に新しい税金の請求書を送ります"

    expect{ @tax_man.update(employee) }.not_to raise_error
    expect{ @tax_man.update(employee) }.to output("#{expected_msg}\n").to_stdout
  end
end
