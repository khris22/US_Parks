class USParks::Park

    attr_accessor :state, :park_name, :park_link, :park_designation, :park_description

    @@all = []

    def initialize(park)
        self.park_name = park_name
        self.park_link = park_link
        self.park_designation = park_designation
        self.park_description = park_description

        # (park_attributes_hash)
        # park_attributes_hash.each { |key, value| self.send("#{key}=", value)}
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

    def destroy_all
        self.all.clear
    end


end