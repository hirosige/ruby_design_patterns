require 'spec_helper'
require 'fileutils'

describe 'Decorator Client' do
  before do
    @output_path = "spec/decorators/output"
    @file_path = "#{@output_path}/simple1.txt"
  end

  it 'Can use' do
    writer = NumberingWriter.new(
        TimestampingWriter.new(
            SimpleWriter.new(@file_path)
        )
    )

    writer.write_line("飾り気のない一行1")
    writer.write_line("飾り気のない一行2")
    writer.close

    expect(File.read(@file_path).split("\n")[0]).to include "飾り気のない一行1 : 1"
    expect(File.read(@file_path).split("\n")[1]).to include "飾り気のない一行2 : 2"
  end
end