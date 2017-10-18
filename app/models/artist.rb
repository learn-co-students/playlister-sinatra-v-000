class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    slug = self.name.downcase.strip.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    unslug = slug.gsub("-", " ").split.map(&:capitalize).join(" ")
    Artist.find_by(name: unslug) 
  end
end
