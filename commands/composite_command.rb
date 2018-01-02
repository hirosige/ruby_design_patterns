require_relative './command'

class CompositeCommand < Command
  def initialize
    @commands = Array.new
  end

  def add(cmd)
    @commands.push(cmd)
  end

  def execute
    @commands.each do |cmd|
      cmd.execute
    end
  end

  def undo_execute
    @commands.reverse_each do |cmd|
      cmd.undo_execute
    end
  end

  def description
    description = ""
    @commands.each do |cmd|
      description += cmd.description + "\n"
    end

    description
  end
end