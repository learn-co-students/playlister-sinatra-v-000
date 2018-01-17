class Genre < ActiveRecord::Base
    has_many :songs, through: :song_genres
    has_many :song_genres
    has_many :artists, through: :songs
    
    def self.find_by_slug(slug)
        self.where("LOWER(name) = ?",slug.gsub("-"," ")).first
    end
    
    def slug
        self.name.split(" ").map {|x| x.downcase}.join("-")
    end
end