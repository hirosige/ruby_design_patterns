require 'spec_helper'

describe 'Employee' do
  before(:each) do
    @employee = Employee.new("hiro", "manager", 10000)
  end

  it 'Can use' do
    up_salary = 10000
    payroll_msg = "彼の給料は#{@employee.salary + up_salary}になりました！#{@employee.title}のために新しい小切手を切ります。\n"
    tax_man_msg = "#{@employee.name}に新しい税金の請求書を送ります\n"
    msg = "#{payroll_msg}#{tax_man_msg}"

    expect{ @employee.salary = 20000 }.to output("#{msg}").to_stdout
  end
end
