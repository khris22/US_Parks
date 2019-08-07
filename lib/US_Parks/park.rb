class USParks::Park

    attr_accessor :state, :name, :url, :designation, :description, :park_info

    @@all = []

    def initialize(name = nil, state = nil)
        @name = name
        @url = url
        @designation = designation if designation
        @description = description
        @park_info_a = []
        self.state
        self.save 
    end

    def state=(state)
        @state = state
        state.add_park(self)
    end

    def add_park_info(park_info)
        park.park_info = self unless park.park_info
        park_info_a << park_info unless park_info_a.include?(park_info)
    end

    def park_info_a #to call the method .park that will return an array of parks
        @park_info_a
     end
    # def all_park_info # this would assign it to self/state
    #     ParkInfo.all.select { |park_info| park_info.park == self}
    # end

    # def state
    #     self.state == nil ? nil : self.state.name
    # end

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