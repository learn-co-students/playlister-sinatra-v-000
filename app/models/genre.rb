class Genre < ActiveRecord::Base

    has_many :song_genres
    has_many :artists, through: :songs
    has_many :songs, through: :song_genres 

    def slug
        self.name.parameterize
    end

    def self.find_by_slug(slug)
        Genre.all.find{|song| song.slug == slug}
    end

end