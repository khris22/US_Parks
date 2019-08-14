class USParks::Scraper

    def self.scrape_state
        # if USParks::State.all.empty?
            doc = Nokogiri::HTML(open("https://www.nps.gov/index.htm"))
            array_states_list = doc.css("li")[5..60]
            array_states_list.each do |state_attr|
                state = USParks::State.new(name)
                    state.name = state_attr.css("a").children.first.text
                    state.url = "https://www.nps.gov" + state_attr.css("a").attribute("href").value                    
            # end
        end   
    end

    def self.scrape_state_park_list(state)
        unless state.scraped
            state.scraped = true
            doc = Nokogiri::HTML(open(state.url))
            array_park_list = doc.css(".col-md-9.col-sm-9.col-xs-12.table-cell.list_left")
            array_park_list.each do |park_attr|
                park = USParks::Park.new(park)
                    park.name = park_attr.css("h3").children.first.text
                    park.url = "https://www.nps.gov" + park_attr.css("a").attribute("href").value + "index.htm"
                    park.description = park_attr.css("p").children.first.text.strip
                    designation = park_attr.css("h2").children.first
                    park.designation = designation.text if designation
                park.state = state 
            end
        end
    end

end
