require_relative './command'

class DeleteFile < Command
  attr_accessor :path

  def initialize(path)
    super("Delete file : #{path}")
    @path = path
  end

  def execute
    if File.exist?(@path)
      @contents = File.read(@path)
    end

    File.delete(@path)
  end

  def undo_execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end
end