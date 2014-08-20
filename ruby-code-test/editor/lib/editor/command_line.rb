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
    when "V"
      @image.vertical_color(*input.args)
    when "H"
      @image.horizontal_color(*input.args)
    when "F"
      @image.replace_color(*input.args)
    when "C"
      @image.clear_color
    else
      puts "That is not a valid command."
      puts "The commands are I, S, L, V, H, F, C and X."
    end
  end
end