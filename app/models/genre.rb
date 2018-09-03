class Genre < ActiveRecord::Base
    has_many :artists, through: :songs
    has_many :song_genres
    has_many :songs, through: :song_genres

    def slug
      genre_name = self.name
      slug = genre_name.downcase.strip.gsub(' ', '-')
    end
  end
