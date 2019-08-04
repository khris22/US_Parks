class USParks::State
    
    attr_accessor :name, :url, :park

    @@all = []
    
    def initialize(name = nil, url = nil)
        @name = name
        @url = url
        # (attributes_hash)
        # attributes_hash.each { |key, value| self.send("#{key}=", value)}
        # binding.pry
        # .send() = sends a message to an object instance and its ancestors in class hierarchy 
        # until some method reacts (because its name matches the first argument)
        @park = []
        self.save
        
    end

    def url


    def self.all
        @@all
    end

    def park
        @park
    end

    def save
        #@@all << self
        self.class.all << self
        self
    end

    def destroy_all
        self.all.clear
    end
# binding.pry
end