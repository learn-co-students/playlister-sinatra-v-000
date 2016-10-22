class Artist < ActiveRecord::Base
attr_accessor :name
belongs_to :artist
has_many :genres
    
    def initialize(attributes)
        @name = attributes[:name]
    end
    
end