class USParks::Park

    attr_accessor :state, :name, :link, :designation, :description #, :park_info

    @@all = []

    def initialize(name = nil)
        self.name = name
        self.link = link
        self.designation = designation #if designation (not all parks have designation)
        self.description = description
        
        # @park_info = []

        # (park_attributes_hash)
        # park_attributes_hash.each { |key, value| self.send("#{key}=", value)}
        self.save 
    end

    def state_name
        self.state == nil ? nil : self.state.name
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