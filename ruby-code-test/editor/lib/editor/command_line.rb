class CommandLine

  attr_reader :command, :args

  def initialize(args)
    @args = args.split
    @command = @args.shift
    run_command
  end

  def run_command
    case @command
    when "I"
      @image = Image.new(*@args)
    end
  end
end