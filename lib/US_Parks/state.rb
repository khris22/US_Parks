class USParks::State
    
    attr_accessor :name, :url, :park, :parks

    @@all = []
    
    def initialize
        @name = name
        @url = url
        @parks = []
        self.save
    end   

    def save
        self.class.all << self
        self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

end

