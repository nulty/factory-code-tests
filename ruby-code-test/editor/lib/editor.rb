$:.unshift(Dir.pwd+"/lib")

require 'rubygems'
require 'pry'

autoload :CommandLine, 'editor/command_line.rb'
autoload :Image, 'editor/image.rb'

unless ENV["EDITOR_ENV"] == "test"
  while((input = STDIN.gets.chomp) !=  "C") do
    CommandLine.new(input)
  end

  puts
  puts "Exiting"
end
