class Bird < ActiveRecord::Base
    has_many :sightings
    has_many :birdwatchers, through: :sightings
end