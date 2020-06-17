class Sighting < ActiveRecord::Base
    belongs_to :birdwatcher
    belongs_to :bird

    def nice_description
        return "#{self.id} ) On #{self.time_of_day} you saw a #{self.bird.color} #{self.bird.common_name}. It was #{self.weather} at #{self.location}"
    end

    # def delete_sighting_but_nice
    #     return ""
    # end
end