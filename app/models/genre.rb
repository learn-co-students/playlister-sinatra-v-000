class Genre < ActiveRecord::Base

  has_many :songs_genres
  has_many :songs, through: :songs_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    unslug = slug.split("-").join(" ")
    self.all.detect do |genre|
      genre.name.downcase == unslug
    end
  end

end