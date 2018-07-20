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
      d_genre = genre.name.downcase
    genre_name = slug.split('-')
  genre_name = genre_name.join(" ")
      d_genre == genre_name
    end
  end

end
