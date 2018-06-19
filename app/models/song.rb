class Song < ActiveRecord::Base
  belongs_to :artist
<<<<<<< HEAD
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    song_name = slug.split("-").map {|word| word.capitalize}.join(" ")
    @song = Song.find_by(name: song_name)
  end
=======
  has_many :songgenres
  has_many :genres, through: :songgenres
>>>>>>> a938e22b2b45c1da7d33228099d2f57221620652
end
