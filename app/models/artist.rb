class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split.collect{|s| s.downcase }.join("-")
  end

  def self.find_by_slug(slug)
    artist_name = slug.split("-").collect{|s| s.capitalize}.join(" ")
    self.find_by(name: artist_name)
  end
end
