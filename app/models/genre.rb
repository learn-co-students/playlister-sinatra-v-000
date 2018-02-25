class Genre < ActiveRecord::Base
<<<<<<< HEAD
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find { |instance| instance.slug == slug}
  end
=======
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

>>>>>>> 1f9fad4566e7bea66933d1080285aea037651e86
end
