class USParks::Scraper

    def self.scrape_state
        if USParks::State.all.empty?
            doc = Nokogiri::HTML(open("https://www.nps.gov/index.htm"))
            array_states_list = doc.css("li")[5..60]
            array_states_list.each do |state_attr|
                state = USParks::State.new
                    state.name = state_attr.css("a").children.first.text
                    state.url = "https://www.nps.gov" + state_attr.css("a").attribute("href").value
                    # binding.pry
            end
        end   
    end

    def self.scrape_state_park_list(index)
        # binding.pry
        state = USParks::State.all[index]
        doc = Nokogiri::HTML(open(state.url))
        
        array_park_list = doc.css(".col-md-9.col-sm-9.col-xs-12.table-cell.list_left")
        array_park_list.each do |park_attr|
            park = USParks::Park.new
                park.name = park_attr.css("h3").children.first.text
                park.url = "https://www.nps.gov" + park_attr.css("a").attribute("href").value + "index.htm"
                park.description = park_attr.css("p").children.first.text.strip
                designation = park_attr.css("h2").children.first
                park.designation = designation.text if designation
            # state << park
            # binding.pry
    
        end
    end

    def self.scrape_park_info(index)
        park = USParks::Park.all[index]
        doc = Nokogiri::HTML(open(park.url))
        
        park_cont_info = doc.css(".vcard")
        park_cont_info.each do |info|
            park_info = USParks::ParkInfo.new
                park_info.address = info.css(".adr").text.split.join(" ") if info.css(".adr")
                park_info.phone = info.css(".tel").text.split.join(" ") if info.css(".tel")
       
        end
    end

end
