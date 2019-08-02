class USParks::State
    
    attr_accessor :name, :state_url

    @@all = []

    def initialize(attributes_hash)
        attributes_hash.each { |key, value| self.send("#{key}=", value)}
        # .send() = sends a message to an object instance and its ancestors in class hierarchy 
        # until some method reacts (because its name matches the first argument)
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