class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
   
    def slug
       slug = name = self.name.split(" ") 
       slug = slug.collect {|word| word.downcase!}
       slug.join("-")
    end
    
    def self.find_by_slug(slug)
       self.all.detect {|instance| instance.slug == slug} 
    end   
end