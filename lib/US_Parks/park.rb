class USParks::Park

    attr_accessor :state, :name, :url, :designation, :description, :park_info

    @@all = []

    def initialize(name = nil)
        self.name = name
        self.url = url
        self.designation = designation 
        self.description = description
        self.save 
    end

    def state_name
        self.state == nil ? nil : self.state.name
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