class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs


  def slug
    genre = self.name
    genre = genre.downcase
    genre = genre.split(" ")
    genre.join("-")
  end

  def self.find_by_slug(slug)
    self.all.find do |genre|
    genre_name = slug.split('-')
  genre_name = genre_name.join(" ")
    genre_name = genre_name.titleize
      genre.name == genre_name
    end
  end

end
