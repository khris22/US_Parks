class USParks::CLI 
    def call
        start_greeting
        list_state_names
        get_state_park_list
        
    end

    def start_greeting
        puts "Welcome to the US Parks App!"
    end

    def list_state_names
        USParks::Scraper.scrape_state
        USParks::State.all.each.with_index(1) do |state, index|
            puts "(#{index})" + "#{state.name}"
        # binding.pry
        end 
    end

    def get_state_park_list
        puts "Please type the number of the state you would like to check."
        puts "Type exit when you want to end"

        input = gets.strip 
        index = input.to_i

            if input == "exit" || input == "EXIT"
                exit_app
            elsif index <= USParks::State.all.length #.size
                park = USParks::State.all[index -1]
                USParks::Scraper.scrape_state_park_list(state)
                puts "(#{index}) #{park.name}"
            else
                puts "Invalid input. Please enter a number."
                get_state_park_list
            end
    end
        
    def exit_app
        puts "Goodbye"
    end

end