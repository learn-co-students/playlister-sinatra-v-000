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

end
