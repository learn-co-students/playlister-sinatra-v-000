class Genre < ActiveRecord::Base
  has_many :songs, through: :song_genres
  has_many :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    slug = slug.split("-").map {|word| word.capitalize }.join(" ")
    self.find_by(name: slug)
  end
end