class Artist < ActiveRecord::Base
    attr_accessor :name
    has_many :songs 
    has_many :artists
    
    def initialize(attributes)
        @name = attributes[:name]
    end
    
end