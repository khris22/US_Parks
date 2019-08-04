class USParks::Scraper

    def self.scrape_state
        doc = Nokogiri::HTML(open("https://www.nps.gov/index.htm"))
        array_states_list = doc.css("li")[5..60]
        array_states_list.each do |state_attr|
            state = USParks::State.new
                state.name = state_attr.css("a").children.first.text
                state.url = "https://www.nps.gov" + state_attr.css("a").attribute("href").value
                # binding.pry
        # array_states_list = doc.css("li")[5..60]
        # array_states_list.each do |state_attr|
        #     input_args = {
        #         name: state_attr.css("a").children.first.text,
        #         state_url: "https://www.nps.gov" + state_attr.css("a").attribute("href").value
        #     }
        # USParks::State.new(input_args)
        # binding.pry
                # array_states_list = doc.css("li").children.map{ |name| name.text }
                #     parse_state_name = array_states_list.values_at(*5..58)

                # array_states_list = doc.css("a").children.map{ |name| name.text.strip}
                #     parse_state_name = array_states_list.values_at(*15..70).to_s
                #     #.join(', ') will return just one big string

        
                # state_name = doc.css("li").children[5..60].children.first.text
                # state_url = "https://www.nps.gov" + doc.css("li").children[5..60].attribute("href").value
            
                # array_state_url = doc.css("a").map{|link| link['href']}
                #     list_state_url = array_state_url.values_at(*7..62)
                #         parse_state_url = list_state_url.map {|url| "https://www.nps.gov" + url  }

                # attributes = {name: state_name, state_url: state_url}
        end   
    end

    def self.scrape_state_park_list(input_state)
        url = input_state.url
        doc = Nokogiri::HTML(open(url))
        # doc = Nokogiri::HTML(open("https://www.nps.gov/state/al/index.htm"))
        array_park_list = doc.css(".col-md-9.col-sm-9.col-xs-12.table-cell.list_left")
        array_park_list.each do |park_attr|
            park = USParks::Park.new
                park.name = park_attr.css("h3").children.first.text
                park.link = "https://www.nps.gov" + park_attr.css("a").attribute("href").value + "index.htm"
                park.designation = park_attr.css("h2").children.first.text if park_attr.css("h2").children.first.text
                park.description = park_attr.css("p").children.first.text.strip
                binding.pry
        # array_park_list.each do |park_attr|
        #     attributes = {
        #         park_name: park_attr.css("h3").children.first.text,
        #         park_link: "https://www.nps.gov" + park_attr.css("a").attribute("href").value + "index.htm",
        #         park_designation: park_attr.css("h2").children.first.text,
        #         park_description: park_attr.css("p").children.first.text.strip    
        #     }
        #     park_attributes = USParks::Park.new(attributes)
                        # doc.css("li")
                        # binding.pry
                        # park name array_park_list = doc.css("li h3").children.first.text
                        # doc.css("h3 a").children.first.text
        end
    end

    # def self.scrape_park_info(park_info)
    #     doc = Nokogiri::HTML(open(park_info.park_link))
    #     # doc = Nokogiri::HTML(open("https://www.nps.gov/hobe/index.htm"))
    #     park_cont_info = doc.css(".col-xs-12.col-sm-6")
    #     # park_cont_info = doc.css(".ParkFooter-contact")
    #     binding.pry
    #     park_contact_info.each do |info|
    #         attributes = {
    #             park_add: info.css(".adr").text.split.join(" "),
    #             park_phone: info.css(".tel").text.split.join(" ")
    #         }
    #     # # doc = Nokogiri::HTML(open("https://www.nps.gov/hobe/index.htm"))
    #     # # park_contact_info = doc.css(".ParkFooter-contact p").text.strip
    #     # # binding.pry
    #     park_info_attributes = USParks::ParkInfo.new(attributes)
    #     end
    # end
end
