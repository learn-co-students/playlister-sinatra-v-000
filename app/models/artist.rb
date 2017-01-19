class Artist < ActiveRecord::Base
    attr_accessor :name
    
    has_many :songs
    has_many :genres
    
    def initialize
    end 
    
    def songs
    end 
    
    def genres
    end 
    
    def slug
    end 
    
    def find_by_slug
    end 
end   
