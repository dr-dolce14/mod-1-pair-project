class Sighting < ActiveRecord::Base
    belongs_to :birdwatcher
    belongs_to :bird
end