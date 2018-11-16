class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name = slug.gsub("-", " ").split.map{|v| v.capitalize}.join(" ")
    Artist.find_by(name: name)
  end
end
