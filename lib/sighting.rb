require 'pry'

class Sighting < ActiveRecord::Base
    belongs_to :birdwatcher
    belongs_to :bird

    def nice_description
        return "#{self.id} ) On #{self.time_of_day} you saw a #{self.bird.color} #{self.bird.common_name}. It was #{self.weather} at #{self.location}"
    end

    def self.see_all_birds_by_everyone_by_location
        puts "Where are you?"
        birdwatcher_location = gets.chomp
        bird_location = Sighting.all.select do |sighting|
            sighting.location == birdwatcher_location
        end
        bird_names = bird_location.map do |bl|
            bl.bird.common_name
        end
        #binding.pry
        puts bird_names
    end

    # def delete_sighting_but_nice
    #     return ""
    # end
end