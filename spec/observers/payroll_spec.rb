require 'spec_helper'

describe 'Payroll' do
  before(:each) do
    @payroll = Payroll.new()
  end

  it 'can update' do
    employee = double('Employee', :name => 'hiro', :title => 'manager', :salary => 10000)
    expected_msg = "彼の給料は#{employee.salary}になりました！#{employee.title}のために新しい小切手を切ります。"

    expect{ @payroll.update(employee) }.not_to raise_error
    expect{ @payroll.update(employee) }.to output("#{expected_msg}\n").to_stdout
  end
end
