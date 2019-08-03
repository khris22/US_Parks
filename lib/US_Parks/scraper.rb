class USParks::Scraper

    def self.scrape_state
        doc = Nokogiri::HTML(open("https://www.nps.gov/index.htm"))
        # array_states_list = doc.css("li").children.map{ |name| name.text }
        #     parse_state_name = array_states_list.values_at(*5..58)

        # array_states_list = doc.css("a").children.map{ |name| name.text.strip}
        #     parse_state_name = array_states_list.values_at(*15..70).to_s
        #     #.join(', ') will return just one big string

        array_states_list = doc.css("li")[5..60]
        array_states_list.each do |state_attr|
            attributes = {
                name: state_attr.css("a").children.first.text,
                state_url: "https://www.nps.gov" + state_attr.css("a").attribute("href").value
            }
            # state_name = doc.css("li").children[5..60].children.first.text
            # state_url = "https://www.nps.gov" + doc.css("li").children[5..60].attribute("href").value
            

        # array_state_url = doc.css("a").map{|link| link['href']}
        #     list_state_url = array_state_url.values_at(*7..62)
        #         parse_state_url = list_state_url.map {|url| "https://www.nps.gov" + url  }

        # attributes = {name: state_name, state_url: state_url}
        USParks::State.new(attributes)
        # binding.pry
        end   
    end

end