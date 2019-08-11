class USParks::CLI 
    def call
        USParks::Scraper.scrape_state
        start_greeting
        list_state_names
        get_state_park_list
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
        sleep 2 
    end

    def list_state_names
        USParks::State.all.each.with_index(1) do |state, index|
        puts "                                  (#{index})".colorize(:light_gray) + "_ _ _" + "#{state.name}".colorize(:cyan)
        end 
    end

    def get_state_park_list
        puts ""
        puts "           ==========================================================================="
        puts "                 Please type the ".colorize(:blue) + "number " + "of the state you would like to check.".colorize(:blue)
        puts "              Type ".colorize(:blue) + "back " + "to see the list of states again or ".colorize(:blue) + "exit " + "when you want to end. ".colorize(:blue)
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
                USParks::State.all[index - 1].parks.each.with_index(1) do |park, index|
                    puts ""
                    puts "            (#{index}) _ _ _ " + "#{park.name}".colorize(:yellow)
                    puts "                    #{park.designation}".colorize(:light_green)
                    puts ""
                    puts "#{park.description}".colorize(:white)
                    puts "For more info: #{park.url}".colorize(:magenta)
                end
            else
                puts " ==> Let's try again. Please enter a number: <==".colorize(:red)
                get_state_park_list
            end
    end
 

    def back_to_menu
        puts ""
        list_state_names
        get_state_park_list
        end_option
    end

    def end_option
        puts ""
        puts "           ==========================================================================="
        puts "                      Type ".colorize(:blue) + "back " + "to see the list of states again or ".colorize(:blue) + "exit " + "to end.".colorize(:blue)
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
        exit        
    end
end