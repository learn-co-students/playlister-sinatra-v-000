class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    genre_name = slug.gsub("-", " ")
    Genre.all.find {|genre| genre.name.downcase == genre_name }
  end
end
