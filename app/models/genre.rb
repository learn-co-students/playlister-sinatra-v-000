class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    slug = self.name.downcase.strip.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    unslug = slug.gsub("-", " ").split.map(&:capitalize).join(" ")
    self.find_by(name: unslug) 
  end




end
