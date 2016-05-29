class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :genres, through: :song_genres
    has_many :song_genres
    
    def self.find_by_slug(slug)
        self.where("LOWER(name) = ?",slug.gsub("-"," ")).first
    end
    
    def slug
        self.name.split(" ").map {|x| x.downcase}.join("-")
    end
    
    # def self.find_by_slug(slug)
    #     #self.find_by(name: slug.split("-").join(" "))
    #     self.where("LOWER(name) = ?",slug.gsub("-"," ")).first
    # end
    
    # def slug
    #     self.name.split(" ").map {|x| x.downcase}.join("-")
    # end
    
    
end