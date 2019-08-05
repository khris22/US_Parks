class USParks::State
    
    attr_accessor :name, :url, :park

    @@all = []
    
    def initialize(name = nil, url = nil)
        @name = name
        @url = url
        self.save
        
    end

    def url
        @url ||= USParks::Scraper.scrape_state_park_list
    end

    def self.all
        @@all
    end

    def add_park(park)
        park.state = self
    end

    def parks
        Park.all.select { |park| park.state == self}
    end

    def save
        self.class.all << self
        self
    end

    def self.destroy_all
        self.all.clear
    end
# binding.pry
end