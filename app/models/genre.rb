class Genre < ActiveRecord::Base
<<<<<<< HEAD

  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(genre)
    @genre_name = genre.split("-").map {|word| word.capitalize}.join(" ")
    @genre = Genre.find_by(name: @genre_name)
  end

=======
  has_many :artists
  has_many :songgenres
  has_many :songs, through: :songgenres
>>>>>>> a938e22b2b45c1da7d33228099d2f57221620652
end
