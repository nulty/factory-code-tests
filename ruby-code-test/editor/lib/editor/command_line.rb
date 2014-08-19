class CommandLine

  attr_reader :command, :args

  def initialize(args)
    @args = args.chars
    @command = @args.shift
  end
end