class USParks::State
    
    attr_accessor :name, :url, :park

    @@all = []
    
    def initialize(name = nil)
        @name = name
        @url = url
        self.save
        @parks = [] # do i need this because I assigned park = self
    end   

    # def parks #to call the method .park that will return an array of parks
    #     @parks
    # end

    def self.all
        @@all
    end

    def add_park(park)
        park.state = self unless park.state
        parks << park unless parks.unclude?(park)
    end

    def all_parks # this would assign it to self/state
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