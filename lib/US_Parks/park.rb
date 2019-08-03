class USParks::Park

    attr_accessor :park_name, :park_link, :park_designation, :park_desccription

    @@all = []

    def initialize(park_attributes_hash)
        park_attributes_hash.each { |key, value| self.send("#{key}=", value)}
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