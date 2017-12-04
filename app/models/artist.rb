class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name = self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name = slug.tr("-", " ").split.map(&:capitalize).join(' ')
    Artist.find_by(name: name)
  end
end
