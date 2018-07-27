class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, :through => :song_genres

    def slug 
        self.name.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        Song.all.find{ |s| s.slug == slug }
    end

    # def artist_name
    #     self.artist.name if self.artist
    # end

    # def artist_name=(artist_name)
    #     self.artist = Artist.find_or_create_by(:name => artist_name)
    # end
end