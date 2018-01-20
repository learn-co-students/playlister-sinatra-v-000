class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def self.find_by_slug(slug)
    name = slug.split("-").map{|i| i.capitalize }.join(" ")
    Genre.find_by(name: "#{name}")
  end

  def slug
    self.name.downcase.split(" ").join("-")
  end
end
