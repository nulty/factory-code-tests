class CommandLine

  attr_reader :command, :args

  def initialize(args)
    @args = args.split
    @command = @args.shift
    CommandLine.run_command(self)
  end

  def self.run_command(input)
    case input.command
    when "I"
      @image = Image.new(*input.args)
    when "S"
      @image.print_image
    when "L"
      @image.color_pixel(*input.args)
    end
  end
end