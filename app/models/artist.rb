class Artist < ActiveRecord::Base
    attr_accessor :name
    
    has_many :songs
    has_many :genres, through: :songs
    #has_many => <#Artist>.songs || <#artist>.genres
    
    def initialize
    end 
    
    def slug
    end 
    
    def find_by_slug
    end 
end   
