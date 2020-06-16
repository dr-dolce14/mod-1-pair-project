class CommandLineInterface

    attr_accessor :birdwatcher

    def greet
        puts "TALK BIRDY TO ME!"
        puts "Welcome to the Backyard Birders Log!"
    end

    def new_birdwatcher
        puts "Do you already have a bird log? (Y/n)"
        user_answer = gets.chomp
        if user_answer == "Y"
            puts "Enter your name:"
            user_input = gets.chomp
            Birdwatcher.find_by(name: "#{user_input}")
        else
            puts "Have a birdtastic day!"
        end
    end

    def get_bird
        puts "What bird did you see?"
        common_name = gets.chomp
        sleep 2
        puts "What color was it?"
        color = gets.chomp
        sleep 2
        puts "How big was it?"
        size = gets.chomp
        sleep 2
        puts "What was it eating?"
        food = gets.chomp
        puts "Where did you see it?"
        user_location = gets.chomp
        puts "What was the weather?"
        user_weather = gets.chomp
        new_bird = Bird.create(common_name: "#{common_name}", color: "#{color}", size: "#{size}", food: "#{food}")
    end

    def new_sighting
        Sighting.create(
            birdwatcher_id: new_birdwatcher.user_input.id, 
            bird_id: get_bird.new_bird.id,
            time_of_day: Time.current,
            weather: "#{get_bird.user_weather}",
            location: "#{get_bird.user_location}"
        )
    end

end