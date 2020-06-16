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
    end

    def see_my_sightings
        self.sighting.reload
        birdwatcher_sightings = Sighting.all.select do |sighting|
            sighting.birdwatcher == self
        end
        birdwatcher_sightings
    end

    def see_my_birds
        puts self.birdwatcher.birds 
    end

    

    # def new_birdwatcher
    #     puts "Do you already have a bird log? (Y/n)"
    #     user_answer = gets.chomp
    #     if user_answer == "Y"
    #         puts "Enter your name:"
    #         user_input = gets.chomp
    #         Birdwatcher.find_by(name: "#{user_input}")
    #     else
    #         puts "Have a birdtastic day!"
    #     end
    # end

    # def get_bird
    #   
    # end

    # def new_sighting
    #     Sighting.create(
    #         birdwatcher_id: new_birdwatcher.user_input.id, 
    #         bird_id: get_bird.new_bird.id,
    #         time_of_day: Time.current,
    #         weather: "#{get_bird.user_weather}",
    #         location: "#{get_bird.user_location}"
    #     )
    # end

end