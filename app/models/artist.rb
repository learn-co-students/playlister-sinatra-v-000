class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-").map(&:capitalize).join(' ')
    self.all.detect { |a| a.name == name }
  end
end
