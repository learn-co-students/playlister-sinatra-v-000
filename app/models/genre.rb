class Genre < ActiveRecord::Base
    has_many :artists, through: :songs
    has_many :song_genres
    has_many :songs, through: :song_genres
   
    def slug
        self.name.split(" ").join("-").downcase
    end
    
    def self.find_by_slug(slug)
       self.all.detect {|instance| instance.slug == slug} 
    end   
end