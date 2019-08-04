# class USParks::ParkInfo
#     attr_accessor :park_add, :park_phone
    
#     @@all = []

#     def initialize(park_info_attribute_hash)
#         park_info_attributes_hash.each { |key, value| self.send("#{key}=", value)}
#         # self.park_contact_info
#         self.save 
#     end

#     def self.all
#         @@all
#     end

#     def save
#         #@@all << self
#         self.class.all << self
#         self
#     end

#     def destroy_all
#         self.all.clear
#     end

# end

