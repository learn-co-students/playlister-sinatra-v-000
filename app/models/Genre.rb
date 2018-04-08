class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    
    def slug
        self.name.split(/ |\_|\-/).map(&:downcase).join("-")
    end

    def self.find_by_slug(genre_name)
        Genre.all.each do |genre|
            if genre.slug == genre_name
                return genre
            end
        end
    end

end