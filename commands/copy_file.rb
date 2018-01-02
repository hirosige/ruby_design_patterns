require_relative './command'
require "fileutils"

class CopyFile < Command
  def initialize(source, target)
    super("Copy file : #{source} to #{target}")
    @source = source
    @target = target
  end

  def execute
    FileUtils.copy(@source, @target)
  end

  def undo_execute
    File.delete(@target)
    if(@contents)
      f = File.open(@target, "w")
      f.write(@contents)
      f.close
    end
  end
end