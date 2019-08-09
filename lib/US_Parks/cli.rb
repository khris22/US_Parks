class USParks::CLI 
    def call
        # start_greeting
        USParks::Scraper.scrape_state
        start_greeting
        list_state_names
        get_state_park_list
        list_park_names
        # get_park_info
        # list_park_contact_info
        end_option
    end

    def start_greeting
        puts "                            ------------------------------"
        puts ""
        puts "                           \u{1F333} Welcome to the US Parks App!\u{1F333}".colorize(:light_green)
        puts ""
        puts "                            ------------------------------"
        puts ""
        puts "             In this app you will be able to view the parks in each state in the US.".colorize(:blue)
        puts "                  Please enter the ".colorize(:blue) + "number".colorize(:white) + " of the state you are interested in.".colorize(:blue)
        puts ""
        puts "                                  happy exploring!".upcase.colorize(:magenta)
        puts ""
        sleep 1 #so the user can have a chance to read the directions first
    end

    def list_state_names
        # USParks::Scraper.scrape_state
        USParks::State.all.each.with_index(1) do |state, index|
        puts "                                  (#{index})".colorize(:light_gray) + "_ _ _" + "#{state.name}".colorize(:cyan)
        # binding.pry
        # sleep 0.15 - slows down the list
        end 
    end

    def get_state_park_list
        puts ""
        puts "           ==========================================================================="
        puts "                 Please type the ".colorize(:blue) + "number " + "of the state you would like to check.".colorize(:blue)
        puts "              Type ".colorize(:blue) + "back " + "to see the list of state again or ".colorize(:blue) + "exit " + "when you want to end. ".colorize(:blue)
        puts "           ==========================================================================="
        puts ""

        input = gets.strip 
        index = input.to_i

            if input.downcase == "exit"
                exit_app
            elsif input.downcase == "back"
                back_to_menu
            elsif index > 0 && index <= USParks::State.all.length
                park = USParks::State.all[index - 1]
                puts "                   ********" + "   You chose:  ".colorize(:light_blue) + "(#{index})_ _ _" + "#{park.name}".upcase.colorize(:cyan) + "   ********"
                USParks::Scraper.scrape_state_park_list(index - 1)
            else
                puts " ==> Let's try again. Please enter a number: <==".colorize(:red)
                get_state_park_list
            end
    end
    
    def list_park_names
        USParks::Park.all.each.with_index(1) do |park, index|
            puts ""
            puts "            (#{index}) _ _ _ " + "#{park.name}".colorize(:yellow)
            puts "                    #{park.designation}".colorize(:light_green)
            puts ""
            puts "  #{park.description}".colorize(:white)
        # binding.pry
            # sleep 0.20
        end
    end

    def get_park_info
        puts ""
        puts "           ==========================================================================="
        puts "                  To know the park's contact information, please type its".colorize(:blue) + " number."
        puts "                      Type ".colorize(:blue) + "back " + "to see the list of state again or ".colorize(:blue) + "exit " + "to end.".colorize(:blue)
        puts "           ==========================================================================="
        puts ""

        input = gets.strip
        index = input.to_i

            if input.downcase == "exit"
                exit_app
            elsif input.downcase == "back"
                back_to_menu
            elsif index > 0 && index <= USParks::Park.all.length
                park = USParks::Park.all[index - 1]
                #park = USParks::State.parks[index - 1]
                USParks::Scraper.scrape_park_info(index - 1)             
                puts "          (#{index}) _ _ _ " + "#{park.name}".colorize(:green)
            else
                puts " ==> Sorry. Let's try again. Please enter a number. <==".colorize(:red)
                get_park_info
            end
    end
    
    def list_park_contact_info
        USParks::ParkInfo.all.each do |contact_info|
            puts ""
            puts "              >>>>>>>>> Park's Contact Information: <<<<<<<<<".colorize(:cyan)
            puts "                #{contact_info.address}".colorize(:light_magenta)
            puts "                #{contact_info.phone}".colorize(:light_magenta)
            puts ""
        end
    end

    def back_to_menu
        USParks::Park.destroy_all
        list_state_names
        get_state_park_list
        list_park_names
        end_option
        # USParks::State.destroy_all
        
        # USParks::ParkInfo.destroy_all
        # call
    end

    def end_option
        puts ""
        puts "           ==========================================================================="
        puts "                      Type ".colorize(:blue) + "back " + "to see the list of state again or ".colorize(:blue) + "exit " + "to end.".colorize(:blue)
        puts "           ==========================================================================="
        puts ""
    
        input = gets.strip

        if input.downcase == "exit"
            exit_app
        elsif input.downcase == "back"
            back_to_menu
        else
            puts " ==> Invalid input. Please try again. <==".colorize(:red)
            end_option
        end

    end

    def exit_app
        puts ""
        puts "                      +++++++++++++++++++++++++++++++++++++++++++++++++"
        puts "                                 Goodbye! Have a great day!".colorize(:light_yellow)
        puts "                      +++++++++++++++++++++++++++++++++++++++++++++++++"
        puts ""
        # break
        exit
            # Kernel.exit!
            # exit a process before executing all of the code.
            # This method can be used to exit a process immediately, skipping any exit handlers on the way.
    end

end