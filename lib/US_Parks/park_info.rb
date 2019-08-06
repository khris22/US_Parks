class USParks::ParkInfo
    attr_accessor :park, :address, :phone
    
    @@all = []

    def initialize(address = nil, phone = nil )
        self.address = address
        self.phone = phone
        self.save 
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
        self
    end

    def self.destroy_all
        self.all.clear
    end

end

