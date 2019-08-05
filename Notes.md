REMINDER: @@all = self.class.all #make it more dynamic

# .send() = sends a message to an object instance and its ancestors in class hierarchy 
    # until some method reacts (because its name matches the first argument)

STATE NOTES
needed to change the hash so all the elements/details from the site will be objects 

# (attributes_hash)
    # attributes_hash.each { |key, value| self.send("#{key}=", value)}
    # binding.pry

    # @parks = [] #no need for this because I assigned park to self
    # @parks << park method to add it to the State class
# url method?
    #tried but failed 
    #not sure if I need this
        # self.class.all.send(url) 
        # State.all.select { |link| link.url}

PARK NOTES
#if designation (not all parks have designation)
    #not sure if I have to put this?? since not all parks have designation


PARK NOTES
#@park_info = [] # used to store park's contact info
    # (park_attributes_hash)
    # park_attributes_hash.each { |key, value| self.send("#{key}=", value)}



PARK_INFO NOTES

#def initialize(park_info_hash = nil)
    #park_info_hash.each { |key, value| self.send("#{key}=", value)}
    # self.park_contact_info


SCRAPER

#def self.scrape_state
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

#def self.scrape_state_park_list(index)
    #url = input_state.url
    #practice site : # doc = Nokogiri::HTML(open("https://www.nps.gov/state/al/index.htm"))

        # park.designation = park_attr.css("h2").children.first.text if park_attr.css("h2").children.first.text
               
                # binding.pry
        
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

#def self.scrape_park_info(index)
    #     # # doc = Nokogiri::HTML(open("https://www.nps.gov/hobe/index.htm"))
    #     # # park_contact_info = doc.css(".ParkFooter-contact p").text.strip
    #     # # binding.pry
    #     park_info_attributes = USParks::ParkInfo.new(attributes)