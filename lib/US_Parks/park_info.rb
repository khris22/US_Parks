class USParks::ParkInfo
    attr_accessor :park, :address, :phone
    
    @@all = []

    def initialize #(park_info_hash = nil)
        #park_info_hash.each { |key, value| self.send("#{key}=", value)}
        # self.park_contact_info
        @address = address
        @phone = phone
        self.save 
    end

    def self.all
        @@all
    end

    def save
        #@@all << self
        self.class.all << self
        self
    end

    def self.destroy_all
        self.all.clear
    end

end

