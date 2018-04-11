class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
    all_genres = Genre.all
    genre = all_genres.find do |genre|
              genre.slug == slug
            end
    return genre
  end

end
