require_relative '../config/environment'
require 'pry'

cli = CommandLineInterface.new()
birdwatcher = cli.greeting()

while birdwatcher == nil do
    birdwatcher = cli.greeting()
end

cli.birdwatcher = birdwatcher
cli.main_menu
