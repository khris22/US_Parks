class USParks::Park

    attr_accessor :name, :url, :designation, :description, :state #:park_info
    @@all = []

    def initialize(park)
        @name = name
        @url = url
        @designation = designation if designation
        @description = description
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