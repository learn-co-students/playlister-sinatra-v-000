class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    genre_name = slug.split("-").map {|name| name.capitalize}.join(" ")
    Genre.find_by_name(genre_name)
  end

end
