class USParks::Park

    attr_accessor :state, :name, :url, :designation, :description, :park_info

    @@all = []

    def initialize(name = nil, state = nil)
        @name = name
        @url = url
        @designation = designation if designation
        @description = description
        @park_info = []
        self.state
        self.save 
    end

    def state=(state)
        @state = state
        state.add_park(self)
    end

    def state
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