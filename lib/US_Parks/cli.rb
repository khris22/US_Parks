require 'colorize'

class USParks::CLI 
    def call
        start_greeting
        list_state_names
        get_state_park_list
        list_park_names
        get_park_info
        list_park_contact_info

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
        puts "Type back to see the list again or exit when you want to end "

        input = gets.strip 
        index = input.to_i

            if input.downcase == "exit"
                exit_app
            elsif input.downcase == "back"
                back_to_menu
            elsif index > 0 && index <= USParks::State.all.length
                park = USParks::State.all[index - 1]
                USParks::Scraper.scrape_state_park_list(index - 1)
                puts "***** You chose:" + "(#{index})  #{park.name} *****".upcase
            else
                puts "Invalid input. Please enter a number."
                get_state_park_list
            end
    end
    
    def list_park_names
        USParks::Park.all.each.with_index(1) do |park, index|
            puts "(#{index})" + "#{park.name}"
            puts "#{park.designation}"
            puts "#{park.description}"
        end
    end

    def get_park_info
        puts "If you would like to know the park's contact information, please type its number"
        puts "or type back to go back again to the list of states"
        puts "or exit"

        input = gets.strip
        index = input.to_i

            if input.downcase == "exit"
                exit_app
            elsif input.downcase == "back"
                back_to_menu
            elsif index > 0 && index <= USParks::Park.all.length
                park = USParks::Park.all[index - 1]
                USParks::Scraper.scrape_park_info(index - 1)
                puts "(#{index})" + "#{park.name}"
            else
                puts "Sorry. Please enter a number."
                get_park_info
            end
    end
    
    def list_park_contact_info
        USParks::ParkInfo.all.each do |contact_info|
            puts "Park's Contact Information:"
            puts "Address: #{contact_info.address}"
            puts "Phone Number: #{contact_info.phone}"
        end
    end

    def back_to_menu
        USParks::State.destroy_all
        USParks::Park.destroy_all
        USParks::ParkInfo.destroy_all
        call
    end

    def exit_app
        puts "Goodbye"
    end

end