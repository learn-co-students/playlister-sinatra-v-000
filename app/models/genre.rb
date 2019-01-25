class Genre < ActiveRecord::Base
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    has_many :song_genres

    def slug
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        genres = Genre.all
        genres.find {|genre| genre.slug == slug}
    end
end
