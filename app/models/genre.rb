class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists
  has_many :artists, through: :songs

  def slug
      self.name.gsub(/ /, '-').downcase
  end

  def self.find_by_slug(slug)
    genre_name = slug.gsub(/-/, ' ')
    genre_name = genre_name.titleize
    Genre.find_by name: genre_name
  end
end
