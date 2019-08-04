class USParks::State
    
    attr_accessor :name, :url, :park

    @@all = []
    
    def initialize(name = nil, url = nil)
        @name = name
        @url = url
            # (attributes_hash)
            # attributes_hash.each { |key, value| self.send("#{key}=", value)}
            # binding.pry
            # .send() = sends a message to an object instance and its ancestors in class hierarchy 
            # until some method reacts (because its name matches the first argument)
        # @parks = [] #no need for this because I assigned park to self
        self.save
        
    end

    def url
        @url ||= USParks::Scraper.scrape_state_park_list
        # self.class.all.send(url)
        # State.all.select { |link| link.url}
    end

    def self.all
        @@all
    end

    def add_park(park)
        # @parks << park
        park.state = self
    end

    def parks
        Park.all.select { |park| park.state == self}
    end

    def save
        #@@all << self
        self.class.all << self
        self
    end

    def destroy_all
        self.all.clear
    end
# binding.pry
end