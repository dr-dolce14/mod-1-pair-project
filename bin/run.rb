require_relative '../config/environment'

cli = CommandLineInterface.new()
logged_in_birdwatcher = cli.greeting()
cli.birdwatcher = logged_in_birdwatcher
cli.main_menu

cli.sighting = logged_in_birdwatcher.sightings





#puts "hello world"
