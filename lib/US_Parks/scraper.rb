class USParks::Scraper

    def self.scrape_state
        doc = Nokogiri::HTML(open("https://www.nps.gov/index.htm"))
        # array_states_list = doc.css("li").children.map{ |name| name.text }
        #     parse_state_name = array_states_list.values_at(*5..58)

        array_states_list = doc.css("a").children.map{ |name| name.text.strip}
            parse_state_name = array_states_list.values_at(*15..70)

        array_state_url = doc.css("a").map{|link| link['href']}
            list_state_url = array_state_url.values_at(*7..62)
                parse_state_url = list_state_url.map {|url| "https://www.nps.gov" + url  }

        attributes = {name: parse_state_name, state_url: parse_state_url}

        USParks::State.new(attributes)

        # binding.pry

    end


end