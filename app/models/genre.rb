class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        self.name.downcase.split(' ').join('-')
    end

    def self.find_by_slug(slug)
        @all_artist_info = []
        self.all.each do |artist|
            if artist.slug == slug
                @all_artist_info << artist
            end
        end 
        @all_artist_info[0]
    end
     
end