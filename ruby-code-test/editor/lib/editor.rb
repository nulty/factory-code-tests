$:.unshift(Dir.pwd+"/lib")

require 'rubygems'

autoload :CommandLine, 'editor/command_line.rb'

unless ENV["EDITOR_ENV"] == "test"
  while((input = STDIN.gets.chomp) !=  "C") do
    CommandLine.new(input)
  end

  puts
  puts "Exiting"
end
