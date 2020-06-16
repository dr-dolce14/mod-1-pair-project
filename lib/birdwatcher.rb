class Birdwatcher < ActiveRecord::Base
    has_many :sightings
    has_many :birds, through: :sightings

    def self.register_a_birdwatcher
        puts "What is your name?"
        birdwatcher_name = gets.chomp

        if Birdwatcher.find_by(name: birdwatcher_name)
            puts "Looks like you already have an account!"
            #logic for making a new sighting here
        else
            Birdwatcher.create(name: birdwatcher_name)
        end
    end

    def self.start_a_new_sighting
        if Birdwatcher.find_by(name: birdwatcher_name)
            Birdwatcher.find_by(name: birdwatcher_name)
            #what were tring to do right now is make it so that a user doesnt have 
            #multiple rows in the user table
            #if this user is already in the table, dont put them in the table again
            #cool
        end
    end

end