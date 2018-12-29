class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  # strip out special characters & refactor to module
  def slug
    self.name.gsub(/\s/, "-").downcase
  end

  def self.find_by_slug(slug)
    self.find do |artist|
      artist.name == slug.split(/\-/).map(&:capitalize).join(" ")
    end
  end
end
