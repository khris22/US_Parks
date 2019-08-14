class USParks::State
    
    attr_accessor :name, :url, :park, :scraped

    @@all = []
    
    def initialize(name)
        @name = name
        @url = url
        self.save
    end   

    def parks
        USParks::Park.all.select do |park|
            park.state == self
        end
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

