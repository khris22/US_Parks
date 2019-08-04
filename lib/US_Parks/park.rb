class USParks::Park

    attr_accessor :state, :name, :link, :designation, :description

    @@all = []

    def initialize(state)
        self.name = name
        self.link = link
        self.designation = designation
        self.description = description
        
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