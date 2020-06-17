class Sighting < ActiveRecord::Base
    belongs_to :birdwatcher
    belongs_to :bird

    def nice_description
        return "#{self.id} ) On #{self.time_of_day} you saw a #{self.bird.color} #{self.bird.common_name}. It was #{self.weather} at #{self.location}"
    end

    # def delete_sighting_but_nice
    #     return "Pick the sighting number that you would like to delete"
    #     sighting_to_destroy = gets.chomp.to_i
    #     byebye = self.where(id: sighting_to_destroy)
    #     byebye.destroy
    # end

end