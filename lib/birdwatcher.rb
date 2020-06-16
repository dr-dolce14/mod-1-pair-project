require 'pry'

class Birdwatcher < ActiveRecord::Base
    has_many :sightings
    has_many :birds, through: :sightings

    def self.register_a_birdwatcher
        puts "Great, what is your name?"
        birdwatcher_name = gets.chomp

        if Birdwatcher.find_by(name: birdwatcher_name)
            puts "Looks like you already have an account!"
        else
            Birdwatcher.create(name: birdwatcher_name)
        end
    end

    def self.login_a_birdwatcher
        puts "What is your name?"
        birdwatcher_name = gets.chomp
        if Birdwatcher.find_by(name: birdwatcher_name)
            Birdwatcher.find_by(name: birdwatcher_name)
        else
            puts "Sorry, you're actually not registered!"
        end
    end

end