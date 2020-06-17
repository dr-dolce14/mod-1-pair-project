require_relative '../config/environment'
require 'pry'

cli = CommandLineInterface.new()
logged_in_birdwatcher = cli.greeting()




until logged_in_birdwatcher != nil
    sleep 2
    system "clear"
    cli.greeting()
    binding.pry
  end

cli.birdwatcher = logged_in_birdwatcher

cli.main_menu



# cli.sighting = logged_in_birdwatcher.sightings





#puts "hello world"
