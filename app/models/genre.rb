class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.split(" ").map(&:downcase).join("-")
  end

  def self.find_by_slug(slug)
    self.find_by(name: slug.split("-").map(&:capitalize).join(' '))
  end

end