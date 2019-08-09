class USParks::State
    
    attr_accessor :name, :url, :park

    @@all = []
    
    def initialize
        @name = name
        @url = url
        self.save
        @parks = []
    end   

    def parks #to call the method .park that will return an array of parks
        parks << USParks::Park.new
        #    @parks
    end

    def self.all
        @@all
    end

    def add_park(park) #this would push in parks array
        park.state = self unless park.state
        parks << park unless parks.unclude?(park)
    end

    def save
        self.class.all << self
        self
    end

    def self.destroy_all
        self.all.clear
    end

end

