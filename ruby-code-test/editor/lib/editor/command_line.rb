class CommandLine

  attr_reader :command, :args

  def initialize(args)
    @args = args.split
    @command = @args.shift
  end
end