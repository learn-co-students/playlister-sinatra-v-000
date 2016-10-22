class Artist < ActiveRecord::Base
    attr_accessor :name
    has_many :songs
    has_many :genre
    
    def initialize(attributes)
        binding.pry
        @name = attributes[:name]
    end
    
end