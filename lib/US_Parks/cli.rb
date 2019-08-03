class USParks::CLI 
    def call
        start_title
        list_state
        
    end

    def start_title
        puts "Welcome to the US Parks App!"
    end

    def list_state
        USParks::Scraper.scrape_state
        USParks::State.all.each.with_index(1) do |state, index|
            puts "(#{index})" + "#{state.name}"
        # binding.pry
        end 
    end
end