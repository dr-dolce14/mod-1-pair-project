require 'pry'

class CommandLineInterface

    attr_accessor :birdwatcher, :prompt, :sighting, :bird

    def initialize()
        @prompt = TTY::Prompt.new
      end

    def greeting
        puts "TALK BIRDY TO ME!"
        puts "Welcome to the Backyard Birders Log!"
        prompt.select ("What would you like to do?") do |menu|
            menu.choice "Register", -> { Birdwatcher.register_a_birdwatcher }
            menu.choice "Login", -> { Birdwatcher.login_a_birdwatcher }
        end
    end

    def main_menu
        system "clear"
        self.birdwatcher.reload
        puts "Welcome, #{self.birdwatcher.name}!"
        prompt.select("What would you like to do?") do |menu|
        #   menu.choice "Look For Birds", -> { self.look_for_birds }
          menu.choice "Report a sighting", -> { self.report_sighting }
          menu.choice "See my sightings", -> { self.see_my_sightings }
          menu.choice "See my birds", -> { self.see_my_birds }
          menu.choice "Update name", -> { self.update_name }
          menu.choice "Delete a sighting", -> { self.delete_sighting }
    
          menu.choice "Exit", -> { self.goodbye }
        end
    end

    # def look_for_birds
    #good place to use API
    # end

    def report_sighting
        puts "What bird did you see?"
        common_name = gets.chomp
        puts "What color was it?"
        color = gets.chomp
        puts "How big was it?"
        size = gets.chomp
        puts "What was it eating?"
        food = gets.chomp
        puts "Where did you see it?"
        birdwatcher_location = gets.chomp
        puts "What was the weather?"
        birdwatcher_weather = gets.chomp
        new_bird = Bird.create(common_name: "#{common_name}", color: "#{color}", size: "#{size}", food: "#{food}")
        new_sighting = Sighting.create(birdwatcher_id: self.birdwatcher.id, bird_id: new_bird.id, time_of_day: Time.current, weather: birdwatcher_weather, location: birdwatcher_location)
        self.main_menu
    end

    def see_my_birds
        birdwatcher_sightings = Sighting.all.select do |sighting|
            sighting.birdwatcher_id == self.birdwatcher.id
        end
        bird_array = birdwatcher_sightings.collect do |sighting|
            sighting.bird_id
        end
        bird_name_array = []
        Bird.all.select do |bird|
            bird_array.each do |bird_id|
                if bird.id == bird_id
                    bird_name_array << bird.common_name
                end
            end
        end
        puts bird_name_array
        puts "\n"
        puts " ============================== "
        prompt.select ("Back to the main menu") do |menu|
            menu.choice "Main Menu", -> { self.main_menu }

        end
        # binding.pry
    end


    
    def see_my_sightings
        birdwatcher_sightings = Sighting.all.select do |sighting|
            sighting.birdwatcher_id == self.birdwatcher.id
        end
        if birdwatcher_sightings == []
            puts "You haven't reported any sightings yet!"
            sleep 2
            self.main_menu
        else
        print birdwatcher_sightings
    end
   
end

    def update_name
        puts "New identity? Put it here!"
        birdwatcher_nam = gets.chomp
        self.birdwatcher.update(name: birdwatcher_nam)
        self.main_menu
    end

    def delete_sighting
        puts "What do you want to delete?"
        p see_my_sightings
        puts "Pick a sighting ID to delete"
        sighting_to_destroy = gets.chomp.to_i
        byebye = Sighting.find(sighting_to_destroy)
        byebye.destroy
        self.main_menu
    end

    def goodbye
        puts "Owl good things must come to an end."
        puts "No egrets."
    end

end


# puts "\n"
# puts " ============================== "
# prompt.select ("Would you like to Go back to the main menu") do |menu|
#     menu.choice "Main Menu", -> { self.main_menu }
# end
  