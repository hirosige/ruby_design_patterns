require 'spec_helper'

describe 'Command Client' do
  before do
    @output_path = "spec/commands/output"
    @file_path = "#{@output_path}/simple1.txt"
  end

  it 'Can use' do
    command_list = CompositeCommand.new
    command_list.add(CreateFile.new("#{@output_path}/file1.txt", "Hello World\n"))
    command_list.add(CopyFile.new("#{@output_path}/file1.txt", "#{@output_path}/file2.txt"))
    command_list.add(DeleteFile.new("#{@output_path}/file1.txt"))

    command_list.execute

    expect(File.exist?("#{@output_path}/file2.txt")).to eq true
  end

  it 'Can undo' do
    command_list = CompositeCommand.new
    command_list.add(CreateFile.new("#{@output_path}/file1.txt", "Hello World\n"))
    command_list.add(CopyFile.new("#{@output_path}/file1.txt", "#{@output_path}/file2.txt"))
    command_list.add(DeleteFile.new("#{@output_path}/file1.txt"))

    command_list.execute
    command_list.undo_execute

    expect(File.exist?("#{@output_path}/file2.txt")).to eq false
  end
end
