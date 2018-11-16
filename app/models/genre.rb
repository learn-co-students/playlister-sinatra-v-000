class Genre < ActiveRecord::Base
  has_many :artists, through: :songs

  has_many :song_genres
  has_many :songs, through: :song_genres

  # has_and_belongs_to_many :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name = slug.gsub("-", " ").split.map{|v| v.capitalize}.join(" ")
    Genre.find_by(name: name)
  end
end
