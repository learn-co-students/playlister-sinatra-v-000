class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        name = self.name.downcase
        name_array = name.split(" ")
        slug = name_array.join("-")
        slug
    end 
    
    def self.find_by_slug(slug)
        @name = slug.split("-").join(" ").titleize()
        Song.all.find {|x| x.name.downcase == @name.downcase}
    end 

end 