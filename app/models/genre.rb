class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    no_slug = slug.split("-").map(&:capitalize).join(" ")
    Genre.find_by name: no_slug
  end

end
